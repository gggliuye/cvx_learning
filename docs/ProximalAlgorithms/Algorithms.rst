4. Proximal Algorithms
=================================

4.1 Proximal minimization
-----------------------

.. math::
  x^{k+1} := \mathbf{prox}_{\lambda f}(x^{k})


* Standard gradient method applied to the Moreau envelope.
* Iteration for finding a fixeed point of proximal operator (non-expansion).
* Disappearing Tikhonov regularization, iterative refinement.
* Gradient flow.

4.2 Proximal gradient method
-------------------------------

Consider the problem in the following form:

.. math::
  minimize \quad f(x) + g(x)

In this form, we split the objective into two terms, one of which is differentiable. This splitting
is not unique, so different splittings lead to different implementations of the proximal gradient method for the same original problem.

The **proximal gradient method** is:

.. math::
  x^{k+1} := \mathbf{prox}_{\lambda^{k} g} (x^{k} - \lambda^{k} \Delta f(x^{k}))


4.3 Accelerated proximal gradient method
-----------------------------------
So-called ‘accelerated’ versions of the basic proximal gradient algorithm
include an extrapolation step in the algorithm. One simple version is :

.. math::
  \begin{align*}
  &y^{k+1} := x^{k} + \omega^{k}(x^{k} - x^{k-1}) \\
  &x^{k+1} := \mathbf{prox}_{\lambda^{k} g} (y^{k+1} - \lambda^{k} \Delta f(y^{k+1}))
  \end{align*}

4.3 Alternating direction method of multipliers
-------------------------------------

Then the alternating direction method of multipliers (ADMM), also known as Douglas-
Rachford splitting, is:

.. math::
  \begin{align*}
  &x^{k+1}:=\mathbf{prox}_{\lambda f}(z^{k} - u^{k}) \\
  &z^{k+1}:=\mathbf{prox}_{\lambda g}(x^{k+1} + u^{k}) \\
  &u^{k+1} := u^{k} + x^{k+1} - z^{k+1}
  \end{align*}


* It can be shown that ADMM converge the optimal value of the original problem.
* ADMM algorithm allows us to perform the optimization in parallel.
* The algortihm is extremely efficient when update x and z speratedly has a low computational cost (compared to the update together - standard descent step).
* Although the algorithm converges when we have two variables, the convergence is not guaranteed when have three or more vaiables. Which it actually performs well in many occasions.

4.4 LM interpretations
--------------------------

So far we have the following interpretations for LM algorithm:

* L2 regularized Newton.
* Trust region algorithm.
* Proximal operator of second order approximation.
* Asymptotionally disappearing Tikhonov regularization of quadratic functions, Iterative refinement.

4.5 The augmented Largrangian method
----------------------------------

Consider the primal cone convex optimization problem:

.. math::
  \begin{align*}
  &minimize \quad f(x) \\
  & subject \ to \quad Ax- b \in K \ (which is \ Ax\succeq_{K}b)
  \end{align*}

Its largangian is :

.. math::
  \begin{align*}
  \mathbb{L}(x, \lambda) &= f(x) - \lambda^{T}(Ax- b) (\quad with \quad \lambda \in K^{*}) \\
  & = - ((A^{T}b)^{T}x - f(x)) + \lambda^{T}b \\
  & = b^{T} \lambda - f^{&}(A^{T} \lambda) \\
  & \triangleq g(\lambda)
  \end{align*}

Then the dual problem is:

.. math::
  \begin{align*}
  &maximize \quad g(\lambda) \\
  & subject \ to \quad \lambda \in K^{*}
  \end{align*}

* If g is differentiable we can use a gradient ascent methods.
* If g is non-differentiable we can use the subgradient methods.
* If g is non-differentiable we can consider **the Moreau-Yosida approximation** (as the following).

.. math::
  g_{\mu}(\lambda) \triangleq \sup_{z\in K^{*}}(g(z) - \frac{1}{2\mu}\|\lambda-z\|^{2}_{2})

Be carefully that the upper is dealing with a concave function g, and we want to maximize it.

We can reform it into :

.. math::
  g_{\mu}(\lambda) = \sup_{z\in K^{*}}(g(z) - \frac{1}{2\mu}\|u\|^{2}_{2}) \ s.t \ u = \lambda-z
