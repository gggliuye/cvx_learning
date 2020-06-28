Proximal Algorithms
==============================

Definitions
--------------------

Proximal algorithms can be viewed as tool for non-smooth, constrained, large-sacle, or distributed problems.
The proximal operator :math:`\mathbf{prox}_{\lambda f} : \mathbf{R}^{n} \to \mathbf{R}^{n}` of f is defined by (where :math:`\lambda > 0`):

.. math::
  \mathbf{prox}_{\lambda f}(v) = \mathop{\arg\min}_{x} (f(x) + \frac{1}{2 \lambda}\| x - v \|_{2}^{2})


Generalized projections
--------------------

When f is the indicator function:

.. math::
  \mathbf{I}_{\mathbf{C}}(x) =
  \begin{cases}
  0  \quad x \in \mathbf{C}\\
  + \infty \quad x \not\in \mathbf{C}
  \end{cases}

where :math:`\mathbf{C}` is a closed nonempty convex set. The proximal operator of f reduces to Euclidean projection onto :math:`\mathbf{C}` :

.. math::
  \mathbf{prox}_{\lambda \mathbf{I}_{\mathbf{C}}}(v) =
  \mathop{\arg\min}_{x} (\mathbf{I}_{\mathbf{C}}(x) + \frac{1}{2 \lambda}\| x - v \|_{2}^{2})

.. math::
  \mathbf{prox}_{\lambda \mathbf{I}_{\mathbf{C}}}(v) = \mathop{\arg\min}_{x \in \mathbf{C}} (\frac{1}{2 \lambda}\| x - v \|_{2}^{2})
   = \Pi_{\mathbf{C}}(v)

Proximal operators thus can be viewed as generalized projections.

Gradient step
--------------------

The proximal operator of f is an optimal point, so It satisfies the optimal condition:

.. math::
  0 = \frac{\partial}{\partial x}(f(x) + \frac{1}{2 \lambda}\| x - v \|_{2}^{2})

.. math::
  0 = \Delta f(x^{*}) + \frac{1}{\lambda} (x^{*}-v)

.. math::
  \mathbf{prox}_{\lambda f}(v) = x^{*} = v - \lambda \Delta f(x^{*}) \approx v - \lambda \Delta f(x)

We will see more later.

Fixed point
--------------------

The following equation holds, if and only if :math:`x^{*}` minimizes f.

.. math::
  \mathbf{prox}_{\lambda f}(x^{*}) = x^{*}

Advantages
--------------------

* Work under extremely general conditions.
* Can be fast.
* Amenanle to distributed optimization.
* Oftern conceptually and mathematically simple.
