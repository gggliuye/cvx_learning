4. The Central Path
==============================

The problem solving algorithm will be developed as an central path algorithm.
By firstly develop the barrier function for the constrains then find an central path, using
the barrier 'force field'.

Suppose the strictly feasible holds.

4.1 Barrier Function for a linear matrix inequality
------------------------

As the former described problems (the primal SDP problem , the dual problem, and the
primal-dual problem) are all SDPs. We will generally consider the linear matrix inequality constrain.
Its barrier is (finity only the problem is strictly feasible) :

.. math::
  \phi(x) = \begin{cases}
  \log\det F(x)^{-1} \quad if F(x)>0 \\
  + \infty \quad \quad otherwise
  \end{cases}

The upper function is : **analytic, stritly convex, and self-concordant** .
It has the following results.
Using :math:`\Delta \log\det X = X^{-1}`.

.. math::
  (\Delta \phi(x))_{i} = \lim_{\delta x \to 0}\frac{Tr(\phi(x+\delta x))}{\delta x} = - Tr(F(x)^{-1}F_{i})

.. math::
  (\Delta^{2} \phi(x))_{i,j} = Tr(F(x)^{-1}F_{i}F(x)^{-1}F_{j})

.. math::
  \begin{align*}
  \log\det (X+\delta X)^{-1} &\approx \log\det X^{-1} + \sum_{i}(\Delta \phi(x))_{i}\delta x_{i}
  + \sum_{i}\sum_{j} \frac{1}{2} \delta x_{i}(\Delta^{2} ]\phi(x))_{i,j}\delta x_{j} \\
  & = \log\det X^{-1} - \sum_{i} Tr(X^{-1}F_{i})\delta x_{i} + \sum_{i,j}\frac{1}{2} \delta x_{i} Tr(X^{-1}F_{i}X^{-1}F_{j}) x_{j} \\
  & = \log\det X^{-1} - Tr(X^{-1}\delta X) + \frac{1}{2} Tr(X^{-1}\delta X X^{-1}\delta X)
  \end{align*}

The first line uses the second order approximation, and using :math:`\delta X = \sum_{i}\delta x_{i}F_{i}`.

4.2 Analytic center
------------------------

Suppose X is bounded. As the barrier is stirctly convex, it has an unique minimizer (**The Analytic Center** of the linear inequality):

.. math::
  x^{*} = \arg\min \phi(x)

Using the first-order optimal condition:

.. math::
  (\Delta \phi(x^{*}))_{i} = - Tr(F(x^{*})^{-1}F_{i}) = 0

The log function of a linear set (detX) could be seen as product of a set of distances. We have the similar interpretation as the general
center path algorith, as a point that maximized the product of a set of distances.

We can use the Newton's method to solve the analytic center as an iterative process of solve the minimize problem:

.. math::
  \begin{align*}
  \delta x^{N} &= \arg\min_{v\in \mathcal{R}^{m}} \phi(x+v) \\
  &= \arg\min_{v\in \mathcal{R}^{m}} \log\det(F(x) +F(v))^{-1} \\
  &= \arg\min_{v\in \mathcal{R}^{m}}\{ - (\log\det F(x)^{-1} - Tr(F(x)^{-1}F(v)) + \frac{1}{2} Tr(F(x)^{-1}F(v) F(x)^{-1}F(v))) \} \\
  &= \arg\min_{v\in \mathcal{R}^{m}} \{ -\sum_{i}v_{i}Tr(F^{-1/2}F_{i}F^{-1/2}) + \frac{1}{2} \sum_{i,j}v_{i}v_{j}Tr((F^{-1/2}F_{i}F^{-1/2})(F^{-1/2}F_{j}F^{-1/2})) \} \\
  &= \arg\min_{v\in \mathcal{R}^{m}} (-2Tr(A) + Tr(A^{T}A) )\\
  &= \arg\min_{v\in \mathcal{R}^{m}} Tr((-I+A)^{T}(-I+A)) \\
  &= \arg\min_{v\in \mathcal{R}^{m}} \| -I + A  \|_{F}
  \end{align*}

Where :math:`F(v) = \sum_{i}v_{i}F_{i}`, and :math:`A =\sum_{i}v_{i} F^{-1/2}F_{i}F^{-1/2}`, and the final
line uses the Frobenius norm. Which is a least squares problem with m variables and n(n+1)/2 equations.

Then the step size could be calcuated using line search algorithm :math:`\hat{p} = \arg\min_{p} \phi(x+p\delta x^{N})`
Which could be simplfied by eigenvalue calculation.

The convergence analysis could be seen in the paper.

4.4 Central Path: Objective
---------------------------

Consider the following inequalities :math:`F(x)>0, c^{T}x=\gamma` , where :math:`p^{*}<\gamma<\bar{p}` (from our assumptions), where :math:`\bar{p} = \sup \{c^{T}x\mid F(x)>0 \}` the bound
of the objective problem. We could define the analytic center of these inequalities:

.. math::
  \begin{align*}
  x^{*}(\gamma) = & \arg\min & \log\det F(x)^{-1} \\
  & subject\ to & F(x) > 0, c^{T}x =\gamma
  \end{align*}

The curve of :math:`x^{*}(\gamma)` is called **the central path** for the semidefinite problem in Chapter 1.
As :math:`\gamma` getting close to :math:`p^{*}`, x converges to an optimal point.

With the lagrangian:

.. math::
  \mathcal{L}(x, \lambda) = \log\det F(x)^{-1} + \lambda (c^{T}x - \gamma)

Apply the opimal condition:

.. math::
  \partial \mathcal{L}(x, \lambda) / \partial x = - \log\det (F(x^{*}(\gamma))^{-1}F_{i}) + \lambda c_{i} = 0

.. math::
  \log\det (F(x^{*}(\gamma))^{-1}F_{i}) =  \lambda c_{i} , \quad i = 1,...,m

It shows that :math:`F(x^{*}(\gamma))^{-1}/\lambda` is dual feasible when :math:`\lambda>0` (as it satisfies the dual feasible conditions).
We could also see that it solve the following dual SDP:

.. math::
  \begin{align*}
  &minimize \quad & \log\det Z^{-1} \\
  &subject\ to & Tr(F_{i}Z) =c_{i}, i=1,...,m, \\
  & & Z>0, \\
  & & -Tr(F_{0}Z) = \gamma - n/\lambda
  \end{align*}

If we use this as a dual problem point. we have the corresponding duality gap:

.. math::
  \eta = Tr(F(x)Z) = Tr(F(x^{*}(\gamma)) F(x^{*}(\gamma))^{-1}/\lambda ) = Tr(I/\lambda) = n/\lambda

The Lagrangian multiplier :math:`\lambda` is related to the duality gap of the point on the path
of centers and the associated dual feasible point.
