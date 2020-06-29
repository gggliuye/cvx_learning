Interpretations
==============================


Moreau-Yosida regularization
------------------------------

From the name we can know that, this interpretation is closely related to the Moreau decomposition.
And the proximal operator has the same formula as the moreau-vosida regularization.

The **infimal convolution** of closed proper convex function f and g on :math:`\mathbb{R}^{n}`, denoted :math:`f \square g`
is defined as :

.. math::
  (f \square g)(v) = \inf_{x}(f(x) + g(v-x))

with :math:`\mathbf{dom}(f\square g) = \mathbf{dom}f + \mathbf{g}`

The main example related is the **Moreau envelope** or **Moreau-Yosida regularization** :math:`M_{\lambda f}` of the function :math:`\lambda f`,
(which has the same definition as :math:`\bar f_{\mu}` in the page "Proerties", the proof of Moreau decomposition) is defined as:

.. math::
  M_{\lambda f}(v) =  \lambda f \square  (1/2)\| \cdot \|^{2}_{2}

.. math::
  M_{\lambda f}(v) = \inf_{x}(f(x) + (1/2lambda) \| x- v\|^{2}_{2})

Convexity
~~~~~~~~~~~~~~~~~~~~~~

Note :math:`L(x,y) = f(y) + \frac{1}{2*\mu} \| x- y\|^{2}_{2}`, then  is jointly convex in x and y, Then :math:`M_{\lambda f}(v) = \inf_{y}L(x,y)`
must be convex (since its epigraph is the projection of a convex set).


Smoothed or Regularized form of f
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Theorem 3.1** : :math:`(f \square g)^{*} = f^{*} + g^{*}`.

**Proof of Theorem 3.1** :

.. math::
  \begin{align*}
  (f\square g)^{*}(x) &= \sup_{u}(y^{T}u - (f\square g)(u)) \\
  &= \sup_{u}(y^{T}u - \inf_{v}(f(v) + g(u-v))) \\
  &= \sup_{u} \sup_{v} (y^{T}u - f(v) - g(u-v)) \\
  & \quad ( t \triangleq u - v \Rightarrow u = t+v) \\
  &= \sup_{t}sup_{v}(y^{T}(t+v) - f(v) - g(t)) \\
  &= \sup_{t}(y^{T}t -g(t)) + \sup_{v}(y^{T}v - f(v))\\
  &= f^{*} + g^{*}
  \end{align*}
