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

`Splitting algorithms for the sum of two nonlinear operators <https://www.researchgate.net/publication/243654261_Mercier_B_Splitting_algorithms_for_the_sum_of_two_nonlinear_operators_SIAM_J_Numer_Anal_166_964-979>`_
