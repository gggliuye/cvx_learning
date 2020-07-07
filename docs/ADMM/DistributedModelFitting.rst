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
