Applications
===========================



Lasso
-------------------

Lasso is short of **Least Absoluate Shrinkage and Selection Operator**. The problem is :

.. math::
  minimize \quad (1/2)\|Ax-b\|^{2}_{2} + \yamma \|x\|_{1}

Proximal gradient method
~~~~~~~~~~~~~~~~~~~~~

It carries out variable selection (by the l1 heuristic), and model fitting (by the least square).
Consider the splitting :

.. math::
  f(x) = (1/2)\|Ax-b\|^{2}_{2} ,\quad g(x) = \gamma \|x\|_{1}

With the gradient and proximal operator:

.. math::
  \Delta f(x) = A^{T}(Ax - b), \quad \mathbf{prox}_{g}(x) = S_{\gamma}(x) = (x - \gamma)_{+} - (-x -\gamma)_{+}

The proximal gradient method will be :

.. math::
  \begin{align*}
  x^{k+1} &:= \mathbf{prox}_{\lambda^{k} g} (x^{k} - \lambda^{k} \Delta f(x^{k})) \\
  & = S_{\lambda^{k}\gamma}(x^{k} - \lambda^{k}A^{T}(Ax - b))
  \end{align*}

The proximal gradient method is also called **ISTA**(iterative shrinkage-thresholding algorithm),
while the accelerated version is known as **FISTA**(fast ISTA), the fast version is basicly adding a momentum.
As the proximal gradient method can be interpreted as seperately optimize f and g.

* We can further accelerate the algorithm by parallex matrix-vector multiplication.
* Or even use the **Gram matrix** as mentioned in Chapter "Evaluating Proximal Operator".
* If we want solution for multiply :math:`\gamma`, we can use the solution of the largest :math:`\gamma` as warm starting.

ADMM
~~~~~~~~~~~~~~~~~~~~~~~~~~

f is quadratic function, we can use the tricks as before:

* Reuse of factorization.
* Warm start with previous gradient, if use an iterative method.
* if n much smaller, we can precompute the Gram matrix.

Matrix decomposition
------------------------

The problem is to decompose matrix A into a sum of components :math:`X_{i}`

.. math::
  \begin{align*}
  &minimize \quad \phi_{1}(X_{1}) + \gamma_{2}\phi_{2}(X_{2}) + \cdot\cdot\cdot + \gamma_{N}\phi_{N}(X_{N}) \\
  &subject\quad to\quad X_{1} + X_{2} + \cdot\cdot\cdot + X_{N} = A
  \end{align*}
