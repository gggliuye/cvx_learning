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
