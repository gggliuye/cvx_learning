Solving TV via ADMM
=================================

`Solving Constrained Total-variation Image Restoration and Reconstruction Problems via Alternating Direction Methods <http://epubs.siam.org/doi/abs/10.1137/090774823>`_

In brief, using ADMM to solve TV reconstruction problems.

1. Introduction
---------------------------------

We have seen the example which use ADMM to solve one-dimensional total variation problems in the chapter L1-norm of the 'ADMM' documentation.
For 2D cases, the situation is more complicate, as the derivatives have two directions, which makes the problem harder to reformed
into a general ADMM form.
In which case, a circulant matrix is introduced, which can be transformed into diagonal matrix using Discrete Fourier Transformation.

The discrete gradient operator :math:`\partial_{1}` and :math:`\partial_{2}` are linear :math:`\mathcal{R}^{n}\to \mathcal{R}^{n-1}` (e.g. each element is :math:`x_{i+1}-x{i}`)
For image processing cases, they are discretized in the horizontal and vertical directions respectively.

While in this paper, we introcduce a circular boundary condition to make the gradients :math:`\mathcal{R}^{n}\to \mathcal{R}^{n}` to make the gradient of each
direction a circulant matrices:

.. math::

\partial_{1} = \begin{bmatrix} -1 & 1 & 0 & ... &0& 0\\ 0& -1 & 1& ... &0& 0 \\ ... \\ 1 &0 &0&...&0&-1 \end{bmatrix}
.. math::
  \partial_{2} = \begin{bmatrix} -1 & 0 & 0 & ... &0 & 1\\ 1& -1 & 0& ... &0& 0 \\ ... \\ 0 &0 &0&...&1&-1 \end{bmatrix}

* The counterpart of this formulation is that it can lead to some artifacts on the image borders.
* In this case, the gradient operators are circulant matrix. They could be diagonalized by DFT.

**Diagonalize of Circulant Matrices**:

For the circulant matrix C(w) we have :

.. math::
  C(w) = \begin{bmatrix} w_{1} & w_{2} & w_{3} & ... & w_{n}\\ w_{n}& w_{1} & w_{2}& ... & w_{n-1} \\ ... \\ w_{2} &w_{3} &w_{4}&...&w_{1} \end{bmatrix}

.. math::
  C(w) = \mathbb{F}Diag(\mathbb{F}w)\mathbb{F}^{-1}

.. math::
  C(w) = \mathbb{F}^{-1}Diag(\bar{\mathbb{F}w})\mathbb{F}

Where, :math:`\mathbb{F}\in \mathcal{C}^{n\times k}`:

.. math::
  \mathbb{F} = \begin{bmatrix} 1 & 1 & 1 & ... & 1\\ 1& \omega & \omega^{2}& ... & \omega^{n-1} \\ ... \\ 1 &\omega^{k-1} &\omega^{2(k-1)}&...&\omega^{(n-1)(k-1)} \end{bmatrix}

We can also rescale horizontal or vertical, to make the matrix non-squared. Then, we have :

.. math::
  \partial_{1} = \mathbb{F}^{-1}D_{1}\mathbb{F}, \ and\ \partial_{2} = \mathbb{F}^{-1}D_{2}\mathbb{F}
