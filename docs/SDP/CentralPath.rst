4. The Central Path
==============================

The problem solving algorithm will be developed as an central path algorithm.
By firstly develop the barrier function for the constrains then find an central path, using
the barrier 'force field'.

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
  (\Delta^{2} \phi(x))_{i,j} = Tr(F(x)^{-2}F_{i}F_{j})

.. math::
  \begin{align*}
  \log\det (X+\delta X)^{-1} &\approx \log\det X^{-1} + \sum_{i}(\Delta \phi(x))_{i}\delta x_{i}
  + \sum_{i}\sum_{j} \frac{1}{2} \delta x_{i}(\Delta^{2} ]\phi(x))_{i,j}\delta x_{j} \\
  & = \log\det X^{-1} - \sum_{i} Tr(X^{-1}F_{i})\delta x_{i} + \sum_{i,j}\frac{1}{2} \delta x_{i} Tr(X^{-1}F_{i}X^{-1}F_{j}) x_{j} \\
  & = \log\det X^{-1} - Tr(X^{-1}\delta X) + \frac{1}{2} Tr(X^{-1}\delta X X^{-1}\delta X)
  \end{align*}

The first line uses the second order approximation, and using :math:`\delta X = \sum_{x}\delta x_{i}F_{i}`.
