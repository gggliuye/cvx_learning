Properties
--------------------------

Separable sum
~~~~~~~~~~~~~~~~~~~~~~~~~~~

If f is seperable across two variables, so :math:`f(x,y) = \phi(x) + \psi(y)`, then:

.. math::
  \mathbf{prox}_{\lambda f}(v, w) = (\mathbf{prox}_{\lambda \phi}(v), \mathbf{prox}_{\lambda \psi}(w))


Proof:

.. math::
  \begin{align*}
  \mathbf{prox}_{\lambda f}(v, w) & = \mathop{\arg\min}_{x, y} (f(x, y) + \frac{1}{2 \lambda}\|
  \begin{bmatrix} x \\ y \end{bmatrix} - \begin{bmatrix} v \\ w \end{bmatrix} \|_{2}^{2})   \\
  &= \mathop{\arg\min}_{x, y} (\phi(x) + \psi(y) + \frac{1}{2 \lambda}\| x - v\|_{2}^{2} + \frac{1}{2 \lambda}\| y - w \|_{2}^{2}) \\
  &= (\mathbf{prox}_{\lambda \phi}(v), \mathbf{prox}_{\lambda \psi}(w))
  \end{align*}
