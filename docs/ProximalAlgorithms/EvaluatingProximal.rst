Evaluating Proximal Operators
=============================

To use the proximal algorithms, we need to evaluate (solve) the proximal operator at each step.
The proximal operator is a convex optimization problem.

* We will investigate solving using generic optimization algorithms.

* Proximal methods can be very useful even in cases when a closed form solution for the proximal operator is not available.

* Proximal operators and certain projection operators have a close connection.


Generic methods
-------------------------

.. math::
  \begin{cases}
  Unconstrained  \begin{cases}
  Non-smooth : \quad Subgradient \quad methods, etc. \\
  Smooth : \quad Gradient \quad methods (Newton, quasi-Newton, etc), etc
  \end{cases} \\
  Constrained \begin{cases}
  Non-smooth: \quad Projected \quad subgradient, etc. \\
  Smooth: \quad Projected \quad gradient, Interior-point \quad methods, etc
  \end{cases}
  \end{cases}


We can also review the solve of SDP, we can transform SDP to a cone problem,
and solve it with a generic interior-point method based cone solver.

Quariatic problems
~~~~~~~~~~~~~~~~~~~~~~~~

.. math::
  f(x) = (1/2)x^{T}Ax + b^{T}x + c

With :math:`A \in \mathbf{S}^{n}_{+}`, then :

.. math::
  \mathbf{prox}_{\lambda f}(v) = \arg\min_{x} ((1/2)x^{T}Ax + b^{T}x + c + (1/2\lambda) (x^{T}x + v^{T}v - 2v^{T}x))

.. math::
  \frac{\partial}{\partial x} =  Ax + (b - (1/\lambda)v) + (1\/lambda)x = 0

.. math::
  \mathbf{prox}_{\lambda f}(v) = (I + \lambda A)^{-1}(v- \lambda b)

In summary, evaluate the proximal operator is to solve the linear equation:

.. math::
  (I + \lambda A)x = v- \lambda b

* We can explore the sparse structure of A, to solve faster.
* If we use direct method (factorize), we could save the factorization for re-use.
* If we use an iterative method, e.g. CG, we can warm start with previous solution.

Smooth functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Same idea here as the descussion above, in most our method, we will try solve :

.. math::
  (I + \lambda H)x = v- \lambda b

* We can use the previous solution as a warm start.
* We can exploit structue of Hessian(H) of f.
