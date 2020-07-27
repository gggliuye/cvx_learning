1. Introduction
=================================

**Semidefinite programming**. consider the problem of minimizing a linear function of a variable
:math:`x\in \mathcal{R}^{m}` subject to a matrix inequality:

.. math::
  \begin{align*}
  &minimize\quad c^{T}x \\
  &subject\ to \quad F(x) = F_{0} + \sum_{i=1}^{m}x_{i}F_{i} \ge 0
  \end{align*}

The problem data are the vector c and symmetric matrices :math:`F_{i}`.

* The inequality sign means F(x) is positive semidefinite, i.e. :math:`z^{T}F(x)z \ge 0 \forall z \in \mathcal{R}^{n}` . It is equivalent to a set of infinite set of linear constraints. It is therefore that the theory of semidefinite programming closely parallels the theory of linear programming.
* Many algorithms for solving LPs should have generalization that handle semidefinite programs.  (e.g. LP is a SDP problem)
* There are some important differences. Duality results are weaker for SDPs than for LPs, and there is no straightforward or practival simplex method for SDPs.
* Recognizing Schur complements in nonlinear expressions is often the key step in reformulating nonlinear convex optimization problems as SDPs.
* **SDPs can be solved very efficiently, both in theory and in partice**.

This paper will discuss the **interor-point method** for SDP.

2. Examples
==================================

2.1 QCQP
------------------------------

.. math::
  \begin{align*}
  &minimize \quad f_{0}(x) \\
  &subject\ to \quad f_{i}(x) \le 0, \ i = 1,...,L,
  \end{align*}

Where :

.. math::
  f_{i}(x) = (A_{i}x+b)^{T}(A_{i}x+b) - c_{i}^{T}x -d_{i}

QCQP could be cast as SDP, while, QCQP could be more efficiently solved via the second-order cone optimzation.

2.2 Maximum eigenvalues and matrix norm minimization
------------------------------

2.3 Logarithmic Chebychev approximation
------------------------------

.. math::
  \minimize \quad \max_{i}\mid a_{i}^{T} -b_{i} \mid

2.4 Structural optimziation
------------------------------

e.g. optimize the physics structure of a building or a bridge.

2.5 Pattern separation by ellipsoid
------------------------------

Seek a quadratic function :math:`f(x) = x^{T}Ax + b^{T}x + c` to sperate data into two sets (x and y).
So that we have :

.. math::
  \begin{align*}
  &(x^{i})^{T}Ax^{i}+b^{T}x^{i} + c \le 0, i =1,...,K, \\
  &(y^{j})^{T}Ay^{j}+b^{T}y^{j} + c \le 0, j =1,...,K,
  \end{align*}

We may further constrain the function to be an ellipsoid (i.e. A>0) .
The problem will be a SDP feasibility problem.

2.6 Statistics
------------------------------

SDPs arise in minimum trace factor analysis.

2.7 Control and System theory
-------------------------

Consider the differential inclusion:

.. math::
  \begin{align*}
  &\frac{dx}{dt} = Ax(t) + Bu(t) \\
  &y(t) = Cx(t) \\
  &\mid u_{i}(t)\mid \le \mid y_{i}(t)\mid ,i= 1,...,p,
  \end{align*}

This a linear system with uncertain, time-varying, unity-bounded, diagonal feedback.

We seek an invariant ellipsoid. i.e. an ellipsoid :math:`\mathcal{E} = \{x\mid x^{T}Px\le 1  \}` such that for any x and u satisfy the upper equations,
:math:`x(T)\in \mathcal{E}` implies :math:`x(t) \in \mathcal{E} \forall t \ge T`. Which means the system will always be in the state
ellipsoid in the future.

The ellipsoid is invariant if and only if the function :math:`V(x) = x(t)^{T}Px(t)` is nonincreasing for any x and u that satisfy the state transformation equations.
