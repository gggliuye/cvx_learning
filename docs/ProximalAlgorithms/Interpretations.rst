Interpretations
==============================


Moreau-Yosida regularization
------------------------------

From the name we can know that, this interpretation is closely related to the Moreau decomposition.
And the proximal operator has the same formula as the moreau-vosida regularization.

The **infimal convolution** pf closed proper convex function f and g on :math:`\mathbb{R}^{n}`, denoted :math:`f \square g`
is defined as :

.. math::
  (f \square g)(v) = \inf_{x}(f(x) + g(v-x))

with :math:`\mathbf{dom}(f\square g) = \mathbf{dom}f + \mathbf{g}`
