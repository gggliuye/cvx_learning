3. Duality
=============================

The dual problem associated with the SDP is :

.. math::
  \begin{align*}
  maximize\quad &-Tr(F_{0}Z) \\
  subject\ to \quad &Tr(F_{i}Z) = c_{i}, i=1,...m, \\
  & Z \ge 0, \ Z^{T} = Z \in \mathbb{R}^{n\times n}
  \end{align*}


The lagrangian of the original problem is :

.. math::
  \begin{align*}
  \mathcal{L}(x,z) &= c^{T}x - z^{T}F(x)z \\
  & = c^{T}x - Tr( z^{T}F(x)z) \\
  & = c^{T}x - Tr( F(x)z^{T}z) \\
  & = c^{T}x - Tr( F(x)Z) , \quad where Z = z^{T}z\\
  & = c^{T}x - Tr( (F_{0} + \sum_{i=1}^{m}x_{i}F_{i})Z) \\
  \end{align*}

.. math::
  \frac{\partial \mathcal{L}(x,Z)}{\partial x_{i}} = c_{i} - Tr(F_{i}Z) = 0, i = 1,...,m

.. math::
  \mathcal{L}(x,z)^{*} = -Tr(F_{0}Z)

**This dual problem is also a SDP.**


**Duality Gap** is (using the upper constrains and the definition of F(x)):

.. math::
  \eta = c^{T}x + Tr(F_{0}Z) = \sum_{i=1}^{m}Tr(ZF_{i}x_{i}) + Tr(ZF_{0}) = Tr(ZF(x)) \ge 0

in which we use :math:`Tr(AB)\ge 0` when :math:`A = A^{T}\ge 0` and :math:`B=B^{T}\ge 0`, Thus we have :

.. math::
  c^{T}x \ge -Tr(F_{0}Z)

i.e. the dual objective value is lower bounds of the primal optimal value.

**Theorem Strong Duality.** we have p* = d* if either of the following conditions holds:

* The primal problem is strictly feasible. i.e. exist an x with F(x) > 0.
* The dual problem is strictly feasible. i.e. exist a Z with :math:`Z=Z^{T}>0`.

(:math:`F(x) \ge 0` is the **feasible** condition, while F(x) > 0 is the **strictly feasible** condtion).
If both conditions hold, the optimal set X and Z are nonempty.

In this case,

.. math::
  c^{T}x = -Tr(F_{0}Z) = p* = d*

Thus :math:`Tr(F(x)Z) = 0`, Since :math:`F(x)\ge 0` and :math:`Z\ge 0`, we have F(x)Z=0, the **complementary slackness** condition.

Thus we have the **optimal conditions for SDP**:

.. math::
  \begin{align*}
  &F(x)\ge 0\\
  &Z\ge 0, \ Tr(F_{i}Z) = c_{i}, i=1,...,m, \\
  &ZF(x) = 0
  \end{align*}
