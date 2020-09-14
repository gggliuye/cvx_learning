Douglas-Rachford Splitting Algorithm
=======================================

Description from the paper  `A first-order primal-dual algorithm for convex problems with applications to imaging <https://link.springer.com/article/10.1007/s10851-010-0251-1>`_ :
Computing the solution of a convex optimization problem is equivalent to the problem of finding zeros of maximal operator T associated
with the subgradient of the optimization problem. And *The proximal point algorithm is probably the most fundamental algorithm
for finding zeros of T* . It is written as the recursion :

.. math::
  w^{n+1} = (I+\tau^{n}T)^{-1}(w^{n})

where :math:`\tau^{n} >0` is are the steps. Unfortunately, in most interesting cases :math:`(I+\tau^{n}T)^{-1}` is hard to
evaluate and hence the partical interest of the proximal algorithm is limited.

If the operator T can be split up into a sum of two maximal monotone operators A and B such that T = A+B and :math:`(I+\tau A)^{-1}`
and :math:`(I+\tau B)^{-1}` are easiser to evaluate thane :math:`(I+\tau T)^{-1}`, then one can devise algorithms which only
need to evaluate the resolvent operators with respect to A and B. DRS(Douglas-Rachford Splitting) is one of the algorithms focus it,
which is known to be a special case of the prximal point algorithm.

1. Splitting algorithms
--------------------------------

From paper `Splitting algorithms for the sum of two nonlinear operators <https://www.researchgate.net/publication/243654261_Mercier_B_Splitting_algorithms_for_the_sum_of_two_nonlinear_operators_SIAM_J_Numer_Anal_166_964-979>`_

For solving the stationary equation (optimal condition), where C is a multivalued monotone opeartor on Hilbert space H:

.. math::
  0\in C(u^{*})

**Recall Proximal Algorithm** :

.. math::
  \bar{x} = \mathbb{prox}_{\lambda, f} (v) = \arg\min_{x} f(x) + \frac{1}{2\lambda}\|x-v\|_{2}

The optimal condition for :math:`\bar{x}` is :

.. math::
  0\in \frac{\partial}{\partial x}\mid_{\bar{x}} = \partial f(\bar{x}) + \frac{1}{\lambda}(\bar{x} - v)

.. math::
  v\in (I+\lambda\partial f)\bar{x}

.. math::
  \bar{x} = (I + \lambda \partial f)^{-1}(v)

Where :math:`(I + \lambda \partial f)^{-1}` is the resolvent operator, the proximal algorithm is to find the fixed point of the resolvent.
And for the fixed point, we have :

.. math::
  v\in (I+\lambda\partial f)v

.. math::
  0\in \partial f

which is exactly the optimal condition for optimizing an objective function f.

**Splitting Algorithm** : consider the case of splitting the operator C, that C = A+B, and A , B are maximal monotone.
(standard methods for the 1979) :

.. math::
  u^{n+1} := (I+\lambda A)^{-1}(I-\lambda B)u^{n}

It is not unconditionally stable [1]_ , but convergent if :math:`\lambda` sufficiently small, and B is Lipschitz continuous.

The corresponding updates algorithm :

.. math::
  \begin{cases}
  \frac{u^{n+1/2}- u^{n}}{\lambda} + Bu^{n} = 0\\
  \frac{u^{n+1}-u^{n+1/2}}{\lambda} + Au^{n+1} = 0
  \end{cases}

.. math::
  u^{n+1} := (I+\lambda A)^{-1}(I+\lambda B)^{-1}u^{n}

It is unconditionally stable, but doesn't convergence except with some special modification.

**Assumption** : assume the stationary problem :math:`0\in C(u^{*})` has at least one solution. Hence :

.. math::
  there\ exist\ u\in H, a\in A(u), b\in B(u)\quad such\ that\ a+b=0


**Notation** :

.. math::
  v = (I + \lambda B)(u) = J_{B}^{\lambda} (u)

.. [1] unconditionally stable : :math:`u^{n}` remains bounded independently of n for any :math:`\lambda`.

1.1 Peaceman-Rachford
~~~~~~~~~~~~~~~~~~~~~~

.. math:
  u^{n+1} := (I+\lambda B)^{-1}(I-\lambda A)(I+\lambda A)^{-1}(I-\lambda B)u^{n}

The algorithm is :

.. math::
  v^{n+1} := (2J_{A}^{\lambda} - I)(2J_{B}^{\lambda}-I)v^{n}

**Convergence** : If B is single valued and satisfies the following property : For all :math:`x_{n},x\in D(B)` such
that :math:`Bx_{n}` is bounded, and :math:`x_{n}\to \bar{x}` weakly, and

.. math::
  (Bx_{n}-Bx, x_{n}-x)\to 0, \quad as n\to \infty

then one has :math:`x=\bar{x}`; then :math:`u^{n}` converges weakly to u, solution of :math:`0\in C(u^{*})`, which is unique.

1.2 Douglas-Rachford
~~~~~~~~~~~~~~~~~~~~~~~~~

The convergence for this algorithm occurs for more general operators A and B than the previous algorithm.

.. math::
  u^{n+1} := (I+\lambda B)^{-1}[(I+\lambda A)^{-1}(I-\lambda B) +\lambda B]u^{n}

The algorithm is :

.. math::
  v^{n+1} := J_{A}^{\lambda}(2J_{B}^{\lambda} - I)v^{n} + (I - J_{B}^{\lambda})v^{n}

**Convergence** Assume that :math:`J_{B}^{\lambda}` is weakly closed, then under the previous Assumption, :math:`u^{n}` converges
weakly to a solution :math:`u=J_{B}^{\lambda}v` of  :math:`0\in C(u^{*})`. (If :math:`J_{A}^{\lambda}` is compact, then the convergence is strong.)

**General case** : in the general case, the algorithm is "almost convergent".

1.3 Applications to evolution equations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See the original paper.
