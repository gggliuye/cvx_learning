5. Constrained Convex Optimization
=====================================

Consider the constrained convex optimization problems:

.. math::
  \begin{align*}
  & minimize \quad f(x) \\
  & subject \ to \quad x in C
  \end{align*}

with variable :math:`x \in \mathbb{R}^{n}`, f and C are convex. This problem could be rewrite into :

.. math::
  \begin{align*}
  & minimize \quad f(x) + g(z) \\
  & subject \ to \quad x - z = 0
  \end{align*}

Where g is the indicator function of set C.

The augmented lagrangian (using the scaled dual variable) is :

.. math::
  \mathbb{L}_{\rho}(x,z,u) = f(x) + g(z) + (\rho/2)\|x-z+u \|_{2}^{2}

The scaled form ADMM updates are :

.. math::
  \begin{align*}
  &x^{k+1} := \arg\min_{c} (f(x) + (\rho/2)\|x-z^{k}+u^{k} \|_{2}^{2} ) \\
  &z^{k+1} := \Pi_{C}(x^{k+1} + u^{k}) \\
  &u^{k+1} := u^{k} + x^{k+1} - z^{k+1}
  \end{align*}

With the primal residual and dual residual:

.. math::
  r^{k} = x^{k} - z^{k}, \quad s^{k} = - \rho(z^{k} - z^{k-1}).

5.1 Quadratic Programming
---------------------------------

Consider QP problem:

.. math::
  \begin{align*}
  &minimize \quad  (1/2)x^{T}Px + q^{T}x \\
  &subject\ to \quad Ax = b, \ x \ge 0
  \end{align*}

We form the functions f and g :

.. math::
  f(x) = (1/2)x^{T}Px + q^{T}x, \quad \mathbf{dom}f = \{ x\mid Ax = b \}

.. math::
  g(z) = I_{C}(z), \quad C = \{ x \| x \ge 0 \}

Then the ADMM form of the problem is :

.. math::
  \begin{align*}
  &minimize \quad  f(x) + g(z) \\
  &subject\ to \quad x - z = 0
  \end{align*}

The ADMM update will be :

.. math::
  \begin{align*}
  &x^{k+1} := \arg\min_{x\in \mathbf{dom}f}(f(x) + (\rho/2)\|x - z^{k} + u^{k} \|_{2}^{2})\\
  &z^{k+1} := \Pi_{C}(x^{k+1} + u^{k}) = (x^{k+1} + u^{k})_{+} \\
  &u^{k+1} := u^{k} + x^{k+1} - z^{k+1}
  \end{align*}

The update of X could be reform into a linear equation with an addition dual variable, using the first order optimal condition:

.. math::
  \begin{bmatrix} P + \rho A^{T}A  & F^{T}\\ F & 0 \end{bmatrix}
  \begin{bmatrix} x^{+} \\ \lambda \end{bmatrix} + \begin{bmatrix}q-\rho A^{T}v \\ -g \end{bmatrix} = 0
