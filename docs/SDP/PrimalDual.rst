5. Primal-dual potential reduction methods
=============================================


5.1  General Description
-----------------------------

The potential function is defined below, where is a summary of log of the duality gap, and the derivation from the
analytic center.

.. math::
  \begin{align}
  \phi(x, Z) &= \mu\sqrt(n) \log(Tr(F(x)Z)) + \psi(x, Z) \\
  & = (n+ \mu\sqrt(n)) \log(Tr(F(x)Z)) - \log\det F(x)Z - n\log n
  \end{align}

As :math:`\psi > 0`, we have :math:`\eta \le \exp(\psi/(\mu\sqrt(n)))`, therefore if the potential funcion value is small,
the duality gap must be small.

The potential reduction method will be a method to iteratively update x and Z, such that reduce the potential by at least
a fixed amount :math:`\delta` in every step. In this condition, we will have convergence in :math:`O(\sqrt(n))` steps,
provided the initial pair is sufficiently centered.

  **Potential reduction algorithm**:

  given strictly feasible x and Z.

  repeat :
    1. (descent direction) Find a suitable direction :math:`\delta x` and a suitable dual feasible direction :math:`\delta Z`.
    2. (step size - plane search) Find :math:`p,q\in \mathbb{R}` that minimize :math:`\phi(x+p\delta x, Z+q\delta Z)`.
    3. Update  :math:`x:=x+p\delta x`, :math:`Z:=Z+ q\delta Z`.

  until duality gap :math:`\eta \le \epsilon`.

The plane search could be seen later in this page, and the descent direction could be obtained by solving the
following linear equations.

.. math::
  S\delta Z S + \sum_{i=1}^{m}\delta x_{i}F_{i} = -D

.. math::
  Tr(F_{j}\delta Z) = 0 , j = 1,..., m.

The S and D in the first function depends on the particular algorithm and could change in every iteration.
The second function is to keep the dual feasiblility of Z. It has m+n(n+1)/2 equations and m+n(n+1)/2 variables.
If F(x) has sparity property, it could be simplier.

It raises as the optimal condition of the following two quadratic minimization problems:

.. math::
  \begin{align*}
  \delta x = & \arg\min_{\mu \in \mathbb{R}^{m}} && (Tr(DS^{-1}(\sum_{i=1}^{m}\mu_{i}F_{i})S^{-1}) \\
  & && \ + \frac{1}{2}Tr((\sum_{i=1}^{m}\mu_{i}F_{i})S^{-1}(\sum_{j=1}^{m}\mu_{j}F_{j})S^{-1}) ),\\
  \delta Z = & \arg\min && Tr(DV)+\frac{1}{2}Tr(VSVS) \\
  & subject\ to && V= V^{T}, \\
  & && Tr(F_{i}V) = 0, i=1,...,m.
  \end{align*}
