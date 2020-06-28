Properties
==============================

Separable sum
--------------------------

If f is seperable across two variables, so :math:`f(x,y) = \phi(x) + \psi(y)`, then:

.. math::
  \mathbf{prox}_{\lambda f}(v, w) = (\mathbf{prox}_{\lambda \phi}(v), \mathbf{prox}_{\lambda \psi}(w))


***Proof:***

.. math::
  \begin{align*}
  \mathbf{prox}_{\lambda f}(v, w) & = \mathop{\arg\min}_{x, y} (f(x, y) + \frac{1}{2 \lambda}\|
  \begin{bmatrix} x \\ y \end{bmatrix} - \begin{bmatrix} v \\ w \end{bmatrix} \|_{2}^{2})   \\
  &= \mathop{\arg\min}_{x, y} (\phi(x) + \psi(y) + \frac{1}{2 \lambda}\| x - v\|_{2}^{2} + \frac{1}{2 \lambda}\| y - w \|_{2}^{2}) \\
  &= (\mathbf{prox}_{\lambda \phi}(v), \mathbf{prox}_{\lambda \psi}(w))
  \end{align*}


Basic operations
------------------------

Post-Composition
~~~~~~~~~~~~~~~~~~~~~~

If :math:`f(x) = \alpha \phi(x) + b`, with :math:`\alpha > 0`, then:

.. math::
    \mathbf{prox}_{\lambda f}(v) = \mathbf{prox}_{\alpha \lambda \phi}(v)

***Proof:***

.. math::
  \begin{align*}
  \mathbf{prox}_{\lambda f}(v) & = \mathop{\arg\min}_{x} (\alpha\phi(x) + b + \frac{1}{2 \lambda}\| x - v\|_{2}^{2})   \\
  &= \mathop{\arg\min}_{x} \alpha(\phi(x) + \frac{1}{2 \lambda \alpha}\| x - v\|_{2}^{2})   \\
  &= \mathbf{prox}_{\alpha \lambda \phi}(v)
  \end{align*}

Pre-Composition
~~~~~~~~~~~~~~~~~~~~~~~~

If :math:`f(x) = \phi(\alpha x + b)`, with :math:`\alpha \nequal 0`, then:

.. math::
    \mathbf{prox}_{\lambda f}(v) = \frac{1}{\alpha}(\mathbf{prox}_{\alpha^{2} \lambda \phi}(\alpha v +b) - b)

***Proof:***

.. math::
  \begin{align*}
  \mathbf{prox}_{\lambda f}(v) & = \mathop{\arg\min}_{x} (phi(\alpha x+b) + \frac{1}{2 \lambda}\| x - v\|_{2}^{2})   \\
  &= \mathop{\arg\min}_{x} \alpha(\phi(\alpha x+b) + \frac{1}{2 \lambda \alpha^{2}}\| (\alpha x +b) - (\alpha v +b)\|_{2}^{2})   \\
  &= \frac{1}{\alpha}(\mathbf{prox}_{\alpha^{2} \lambda \phi}(\alpha v +b) - b)
  \end{align*}


If :math:`f(x) = \phi(Q x )`, with Q orthogonal, then:

.. math::
    \mathbf{prox}_{\lambda f}(v) = Q^{T}\mathbf{prox}_{\lambda \phi}(Q v )


Affine addition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If :math:`f(x) = \phi(x) + a^{T}x + b`, then :

.. math::
    \mathbf{prox}_{\lambda f}(v) = \mathbf{prox}_{\lambda \phi}(v - \lambda \a)

***Proof:***

.. math::
  \begin{align*}
  \mathbf{prox}_{\lambda f}(v) &= \mathop{\arg\min}_{x} (phi(x) + a^{T}x + b + \frac{1}{2 \lambda}\| x - v\|_{2}^{2})   \\
  &= \mathop{\arg\min}_{x} (phi(x) + \frac{1}{2 \lambda}(x^{T}x + v^{T}v - 2v^{T}x + 2 \lambda a^{T}x) )   \\
  &= \mathop{\arg\min}_{x} (phi(x) + \frac{1}{2 \lambda}(x^{T}x + v^{T}v - 2(v^{T} - \lambda a^{T})x)) )   \\
  &= \mathbf{prox}_{\lambda \phi}(v - \lambda \a)
  \end{align*}

In the last few equations, notices that we can add term of a and v.

Regularization
~~~~~~~~~~~~~~~~~~~~~~

If :math:`f(x)=\phi(x) + (\frac{\rho}{2} \| x- a\|^{2}_{2})`, then:

.. math::
    \mathbf{prox}_{\lambda f}(v) = \mathbf{prox}_{\bar{\lambda} \phi}(\frac{\bar{\lambda}}{\lambda}v - (\rho \bar{\lambda})\a)

where :math:`\bar{\lambda} = \lambda /(1+\lambda \rho)`

Fixed Points
-----------------------------

The point :math:`x^{*}` minimizes f if and only if:

.. math::
  x^{*} = \mathbf{prox}_{\lambda f}(x^{*})

***Proof:*** Can be found in the paper.

Lipschitz continuous
~~~~~~~~~~~~~~~~~~~~~

(Mostly from Wikipedia) Given two metric space :math:`(X, d_{X})` and :math:`(Y, d_{Y})`, where :math:`d_{X}`
denotes the metric on the set X and :math:`d_{Y}` is the metric on the set Y, a function :math:`f : X \to Y` is called
Lipschitz continuous, if exist a constant :math:`K \in \mathbf{R}; K > 0`
