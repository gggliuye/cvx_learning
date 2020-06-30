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
  Unconstrained  \begin{cases}
  Non-smooth : \quad Subgradient \quad methods, etc. \\
  Smooth : \quad Gradient \quad methods (Newton, quasi-Newton, etc), etc
  \end{cases}

.. math::
  Constrained \begin{cases}
  Non-smooth: \quad Projected \quad subgradient, etc. \\
  Smooth: \quad Projected \quad gradient, Interior-point \quad methods, etc
  \end{case}
