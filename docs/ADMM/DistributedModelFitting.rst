8. Distributed Model Fitting
=================================

It to find a model best fit the measurements. It normally has a observation error term ('l' for loss), and a regularization term (r).
l and r are chosen to be convex.
As the following shows a problem to fit a linear model:

.. math::
  minimize \quad l(Ax - b) + r(x)

Assume l is additive:

.. math::
  l(Ax-b) = \sum_{i=1}^{m}l_{i}(a_{i}^{T}x - b_{i})

:math:`l_{i}` is the loss of ith training example. :math:`a_{i}` is the feature vector of example i (the ith system input), and
:math:`b_{i}` is the ouput(response) of the example i (the ith observation).

* r choose l2 : :math:`r(x) = \lambda\|x\|_{2}^{2}`, is the tikhonov regularization or a ridge penalty.
* r choose l1 : :math:`r(x) = \lambda\|x\|_{1}` is a lasso penalty.
* In some case, part of the parameters should not be regularized (e.g. offset parameters).

* Split across training examples.
* Split across features.

8.1 Examples
---------------------


* Regression
* Classification
* Image segmentation, denoise, decomposition.


8.2 Splitting across examples
----------------------------

**Large amount of relatively low-dimensional data**. Goal: solve in a distributed way.
Partition A and b (example inputs and measurements):

.. math::
  A = \begin{bmatrix} A_{1} \\ : \\ A_{N} \end{bmatrix}, \quad b = \begin{bmatrix} b_{1} \\ : \\ b_{N} \end{bmatrix},

The problem will be :

.. math::
  minimize \quad \sum_{i=1}^{N}l_{i}(A_{i}x - b_{i}) + r(x)

Reform the problem into **consensus form** to enable distributed calculation (turn into a standard ADMM type of problem):

.. math::
  \begin{align*}
  &minimize \quad \sum_{i=1}^{N}l_{i}(A_{i}x_{i} - b_{i}) + r(z) \\
  & subject\ to \quad x_{i}-z = 0, \ i = 1,..., N
  \end{align*}

Using the scaled form of ADMM updates (see 7.3 sharing problems for more details):

.. math::
  \begin{align*}
  & x_{i}^{k+1} := \arg\min_{x_{i}} (l_{i}(A_{i}x_{i} - b_{i}) + (\rho/2)\|x_{i} - z^{k} + u_{i}^{k} \|_{2}^{2}) \\
  & z^{k+1} := \arg\min_{z} (r(z) + (N\rho/2)\|\bar{x}^{k+1} - z + \bar{u}^{k} \|_{2}^{2}) \\
  & u_{i}^{k+1} := u_{i}^{k} + x_{i}^{k+1} - z^{k+1}
  \end{align*}

* Lasso
* Sparse Logistic Regression
* Support Vector Machine

8.2.1 Group Lasso
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Lasso have the function f being squared l2 norm, and r being the l1 norm. Then the ADMM udpates are:

.. math::
  \begin{align*}
  &x_{i}^{k+1} := \arg\min_{x_{i}} ((1/2)\|A_{i}x_{i} -b_{i}\|_{2}^{2} + (\rho/2)\|https://cvx-learning.readthedocs.io/en/latest/ADMM/L1Norm.html#l1-regulaized-lossx_{.i}-z^{k}+u_{i}^{k}\|_{2}^{2}) \\
  &z^{k+1}:= S_{\lambda/\rho N}(\bar{x}^{k+1} + \bar{u}^{k}) \\
  &u^{k+1}_{i} := u_{i}^{k} + x_{i}^{k+1} - z^{k+1}
  \end{align*}


See `here <https://cvx-learning.readthedocs.io/en/latest/ProximalAlgorithms/Applications.html#lasso>`_ for some details about the update of x.
The difference from the `serial version <https://cvx-learning.readthedocs.io/en/latest/ADMM/L1Norm.html#lasso>`_ is that :

* The update of different group of variables :math:`x_{i}` could be carry out in parallel.
* The collection and averaging steps.

8.2.2 Distributed l_1-regularized logistic regression
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Could be compared with the `serial version <https://cvx-learning.readthedocs.io/en/latest/ADMM/L1Norm.html#l1-regulaized-loss>`_.
Could be seen `function <http://stanford.edu/~boyd/papers/admm/logreg-l1/distr_l1_logreg.html>`_ and
`Script <http://stanford.edu/~boyd/papers/admm/logreg-l1/distr_l1_logreg_example.html>`_ using L-BFGS for distributed calculations.

8.2.3 Support Vector Machine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here we model a linear support vector machine problem, which is a linear model fitting problem.
Which is to find a best linear model applied to feature variables x (:math:`w^{T}x_{j} + b`) to best fit the observation y (:math:`y_{j}`), where y is a binary variable.

Which is to say, if the observation :math:`y_{j}` is 1, we want :math:`w^{T}x_{j} + b \to 1`
and if the observation :math:`y_{j}` is -1, we want :math:`w^{T}x_{j} + b \to -1`.
Which is a optimization problem :

.. math::
  minimize \quad \sum_{j=1}^{M} (1-y_{j}(w^{T}x_{j}+b))

In partice, we can truncate the results of the model by 1 or -1, so the problem will be better if we optimize this:

.. math::
  minimize \quad \sum_{j=1}^{M} (1-y_{j}(w^{T}x_{j}+b))_{+}

Where we have M obervations in total. The problem is equivalent to :

.. math::
  minimize \quad \sum_{j=1}^{M}(1 + \begin{bmatrix} -y_{j}x_{j}^{T} & -y_{j} \end{bmatrix}
  \begin{bmatrix} w \\ b \end{bmatrix})_{+}



8.3 Splitting across Features
-------------------------

Model fitting problems with a modest number of examples and a large number of features.

* NLP(natural language processing) : pairs of adjucent words (bigrams), etc.
* Bioinformatics: DNA mutation, etc.

Partition of the parameter vector x as :math:`x = (x_{1}, ..., x_{N})`, and A as :math:`A = [A_{1},...,A_{N}]`,
the problem will be:

.. math::
  minimize\quad l(\sum_{i=1}^{N} A_{i}x_{i} -b) + \sum_{i=1}^{N}r_{i}(x_{i})

Reform into consensus problem:

.. math::
  \begin{align*}
  & minimize \quad l(\sum_{i=1}^{N} z_{i} -b) + \sum_{i=1}^{N}r_{i}(x_{i}) \\
  & subject\ to \quad A_{i}x_{i} - z_{i} =0,\ i=1,...,N
  \end{align*}

The corresponding scaled form of ADMM is :

.. math::
  \begin{align*}
  & x_{i}^{k+1} := \arg\min_{x_{i}} (r_{i}(x_{i}) + (\rho/2)\|A_{i}x_{i} - z_{i}^{k} + u_{i}^{k} \|_{2}^{2}) \\
  & z^{k+1} := \arg\min_{z} (l(\sum_{i=1}^{N}z_{i}-b) + \sum_{i=1}^{N}(\rho/2)\|A_{i}x_{i}^{k+1} - z_{i} + u_{i}^{k} \|_{2}^{2}) \\
  & u_{i}^{k+1} := u_{i}^{k} + A_{i}x_{i}^{k+1} - z^{k+1}_{i}
  \end{align*}
