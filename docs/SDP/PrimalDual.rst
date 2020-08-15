5. Primal-dual potential reduction methods
=============================================


5.1  General Description
-----------------------------

The potential function is defined below, where is a summary of log of the duality gap, and the derivation from the
analytic center.

.. math::
  \begin{align}
  \phi(x, Z) &= \mu\sqrt{n} \log(Tr(F(x)Z)) + \psi(x, Z) \\
  & = (n+ \mu\sqrt{n}) \log(Tr(F(x)Z)) - \log\det F(x)Z - n\log n
  \end{align}

As :math:`\psi > 0`, we have :math:`\eta \le \exp(\psi/(\mu\sqrt{n}))`, therefore if the potential funcion value is small,
the duality gap must be small.

The potential reduction method will be a method to iteratively update x and Z, such that reduce the potential by at least
a fixed amount :math:`\delta` in every step. In this condition, we will have convergence in :math:`O(\sqrt{n})` steps,
provided the initial pair is sufficiently centered.

  **Potential reduction algorithm**:

  **given** strictly feasible x and Z.

  **repeat** :
    1. (descent direction) Find a suitable direction :math:`\delta x` and a suitable dual feasible direction :math:`\delta Z`.
    2. (step size - plane search) Find :math:`p,q\in \mathbb{R}` that minimize :math:`\phi(x+p\delta x, Z+q\delta Z)`.
    3. Update  :math:`x:=x+p\delta x`, :math:`Z:=Z+ q\delta Z`.

  **until** duality gap :math:`\eta \le \epsilon`.

The plane search could be seen later in this page, and the descent direction could be obtained by solving the
following linear equations (A).

.. math::
  S\delta Z S + \sum_{i=1}^{m}\delta x_{i}F_{i} = -D

.. math::
  Tr(F_{j}\delta Z) = 0 , j = 1,..., m.

The :math:`S=S^{T}` and :math:`D=D^{T}` in the first function depends on the particular algorithm and could change in every iteration.
The second function is to keep the dual feasiblility of Z. It has m+n(n+1)/2 equations and m+n(n+1)/2 variables.
If F(x) has sparity property, it could be simplier.

It can be solved efficiently via a least-squares problem [1]_ :

.. math::
  \delta x = \arg\min_{\mu\in \mathbb{R}^{m}}\| S^{-1/2} (D+\sum_{i=1}^{m}\mu_{i}F_{i}) S^{-1/2} \|_{F}

It raises as the optimal condition of the following two quadratic minimization problems:

.. math::
  \begin{align*}
  \delta x = & \arg\min_{\mu \in \mathbb{R}^{m}} && (Tr(DS^{-1}(\sum_{i=1}^{m}\mu_{i}F_{i})S^{-1}) \\
  & && \ + \frac{1}{2}Tr((\sum_{i=1}^{m}\mu_{i}F_{i})S^{-1}(\sum_{j=1}^{m}\mu_{j}F_{j})S^{-1}) ),\\
  \delta Z = & \arg\min_{V} && Tr(DV)+\frac{1}{2}Tr(VSVS) \\
  & subject\ to && V= V^{T}, \\
  & && Tr(F_{i}V) = 0, i=1,...,m.
  \end{align*}

.. [1] Proof could be found [here](), and an example of LP problem could be found [here]()

5.2 Potential reduction method 1
-----------------------------------

Referring to the potential function, it is not a convex function.
While the first term :math:`(n+ \mu\sqrt{n}) \log(Tr(F(x)Z))` is concave in x and Z.
Which will offer a negative semidefinite term to Hessian of :math:`\psi`. This method is
to **ignore the second derivative of this concave term**.

Apply first order approximation of the first term and second order approxmiation for the
other terms, we will have :math:`\psi(x+\mu,Z+V)`. Then respectively minimize the approximation
of :math:`\psi`, we will found they are equivalent to the linear equations (A), with respectively [2]_ :

* For :math:`\delta x` update : :math:`D=\rho FZF-F` and :math:`S=F`, gets :math:`\delta x^{p}, \delta Z^{p}`.
* For :math:`\delta Z` update : :math:`D=\rho F-Z^{-1}` and :math:`S=Z^{-1}` gets :math:`\delta x^{d}, \delta Z^{d}`..

And we have the convergence Theorem : Let :math:`x^{k}, Z^{k}` denotes the values of x and Z after kth
iteration of the potential reduction algorithm with search directions :math:`\delta x^{p}, \delta Z^{d}`.
We have :

.. math::
  \psi(x^{(k+1)}, Z^{(k+1)}) \le \psi(x^{(k)}, Z^{(k)}) - 0.78

.. [2] Proof could be found [here]()

5.3 Potential reduction method 2
-----------------------------------

The upper problem needs to solve two problem seperately to obtain :math:`\delta x` and :math:`\delta Z`.
While we could choose to solve only the primal system, use :math:`\delta x^{p}, \delta Z^{p}` to update.
Which will have :

.. math::
  \psi(x^{(k+1)}, Z^{(k+1)}) \le \psi(x^{(k)}, Z^{(k)}) - 0.05

We could also use the dual solutions only  :math:`\delta x^{d}, \delta Z^{d}` to update, which has :

.. math::
  \psi(x^{(k+1)}, Z^{(k+1)}) \le \psi(x^{(k)}, Z^{(k)}) - 0.05

It has no significant convergence guaranteed, while it seems to perform better in practice than the first method.

5.4 Potential reduction method 3
-----------------------------------

Nesterov and Todd proposed another variation which perserves the primal-dual symmetry yet avoids solving two systems
per iteration. In their method, primal and dual search directions are computed from:

.. math::
  RR^{T}\delta Z^{sym} RR^{T} + \sum_{i=1}^{m}\delta x^{sym}_{i}F_{i} = -\rho F + Z^{-1},

.. math::
  Tr(F_{j}\delta Z^{sym}) = 0,j =1,...,m.

See more details in the original paper. This method will have convergence:

.. math::
  \psi(x^{(k+1)}, Z^{(k+1)}) \le \psi(x^{(k)}, Z^{(k)}) - 0.24

5.5 Plane search
------------------------

The potential function could be written as :

.. math::
  \begin{align}
  \psi(x+p\delta x, Z+q\delta Z) &= \psi(x,Z) + (n+v\sqrt{n})\log(1+c_{1}p+c_{2}q) \\
  & - \log\det(I+pF^{-1/2}\delta FF^{-1/2}) - \log\det(I+qZ^{-1/2}\delta ZZ^{-1/2})
  \end{align}

Where :math:`F=F(x)`, :math:`\delta F = \sum_{i=1}^{m}\delta x_{i}F_{i}`, :math:`c_{1} = \frac{c^{T}\delta x}{Tr(F(x)Z)}`,
and :math:`c_{2} = \frac{Tr(F_{0}\delta Z)}{Tr(F(x)Z)}`. It could be simplified by eigenvalue decompositions and solve via standard methods.
