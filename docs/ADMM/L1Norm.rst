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

Reform the problem with two functions : :math:`f(x) = \|x\|_{1}` and :math:`g(z) = \I_{C}(z)`.
g is the indicate function of the set C, where :math:`C = \{ z \| Az = b \}`. And adding the consensus constraint :math:`x= z`,
we will have the following equivalent problem:

.. math::
  \begin{align*}
  &minimize \quad \|z\|_{1} + \I_{C}(x) \\
  &subject\ to \quad x = z
  \end{align*}
