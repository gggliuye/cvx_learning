6. L1 Norm Problems
====================



6.1 Basis pursuit problem
--------------------------------

The problem is a l1 minizmization in a linear constrained set :

.. math::
  \begin{align*}
  &minimize \quad \|x\|_{1} \\
  &subject\ to \quad Ax = b
  \end{align*}

Reform the problem with two functions : :math:`f(x) = \|x\|_{1}` and :math:`g(z) = I_{C}(z)`.
g is the indicate function of the set C, where :math:`C = \{ z \| Az = b \}`. And adding the consensus constraint :math:`x= z`,
we will have the following equivalent problem:

.. math::
  \begin{align*}
  &minimize \quad \|z\|_{1} + I_{C}(x) \\
  &subject\ to \quad x = z
  \end{align*}

Using the scaled ADMM udpates we have:

.. math::
  \begin{align*}
  &x^{k+1} = \arg\min_{x} (I_{C}(x) + (\rho/2)\|x-z^{k}+u^{k}\|^{2}_{2} ) = \mathbf{prox}_{1/\rho, I_{C}}(z^{k}-u^{k}) \\
  &z^{k+1} = \arg\min_{z} (\|z\|_{1} + (\rho/2)\|x^{k+1}-z+u^{k}\|^{2}_{2} ) = \mathbf{prox}_{1/\rho, l1}(x^{k} + u^{k})\\
  &u^{k+1} = u^{k} + x^{k+1} -z^{k+1}
  \end{align*}

From the evaluation of proximal operators, we know the proximal operator of indicator function is equivalent to the projection operator.
And the proximal oprator of the l1 norm is a shrinkage funtion. As a result, we have the following updates:


.. math::
  \begin{align*}
  &x^{k+1} = \Pi_{c}(z^{k}-u^{k}) \\
  &z^{k+1} = S_{1/\rho}(x^{k} + u^{k})\\
  &u^{k+1} = u^{k} + x^{k+1} -z^{k+1}
  \end{align*}

6.1.2 Updates
~~~~~~~~~~~~~~~~~~~

The shrinkage function is ::
  function y = shrinkage(a, kappa)
      y = max(0, a-kappa) - max(0, -a-kappa);
  end

The projection into C is :

.. math::
  \Pi_{Ax=b}(x) = (I - A^{T}(AA^{T})^{-1}A)x + A^{T}(AA^{T})^{-1}b

This solution could be found by solving the following problem (finding the projection of z into the set C):

.. math::
  \begin{align*}
  minimize \quad \|z-x\|_{2}^{2} \\
  subject\ to \quad Ax = b
  \end{align*}

For the lagrangian:

.. math::
  \mathcal{L}(x, \lambda) = \|z-x\|_{2}^{2} + \lambda^{T}(Ax-b)

The gradient with respect to x is zero:

.. math::
  \frac{\partial\mathbcal{L}(x,\lambda)}{\partial x} = 2x - 2x + A^{T}\lambda = 0

.. math::
  x^{*} = z - A^{T}\lambda/2

So the dual function is :

.. math::
  g(\lambda) = - \|A^{T}\lambda/2\|_{2}^{2} + \lambda^{T}(Az-b)

.. math::
  \frac{\partial g(\lambda)}{\partial \lambda} = (Az-b) - (AA^{T})\lambda/2 = 0

.. math::
  \lambda = (AA^{T})^{-1}(Az-b)

Subsititute into the equation :math:`x^{*} = z - A^{T}\lambda/2`, we have:

.. math::
  x^{*} = (I - A^{T}(AA^{T})^{-1}A)z + A^{T}(AA^{T})^{-1}b
