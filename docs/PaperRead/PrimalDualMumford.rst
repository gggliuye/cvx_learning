Primal-Dual Mumford-Shah
===========================================

1. Mumford-Shah Functional
---------------------------------------

Firstly, we introduce the **Mumford-Shah Functional** from paper `Optimal approximations by piecewise smooth functions and associated variational problems <https://dash.harvard.edu/bitstream/handle/1/3637121/Mumford_OptimalApproxPiece.pdf?sequence%3D1>`_

We have the g the "image" data, whose domain is in :math:`R\in \mathbb{R}^{2}`, and f : :math:`\cup R_{i \to \mathbb{R}}` a differentiable smooth function on :math:`\cup R_{i}`

Here we consider to segment the image into :math:`\{ R_{i}\}`, disjoint connected open subsets of R. :math:`\Tau` will be the
union of the part of the boundary of :math:`R_{i}` inside R, so that :

.. math::
  R = R_{1}\cup R_{2}\cup .. \cup R_{n}\cup \Tau

And the **Mumford-Shah Function** is defined as a energy function:

.. math::
  E(f, \Tau) = \mu^{2} \int \int_{R}(f-g)^{2}dxdy + \int \int _{R\setminus \Tau}\|\triangledown f \|^{2}dxdy + \nu \mid \Tau\mid

Where we have the first term: to ensure f is close to g. The second term: that f is smooth within the region :math:`R_{i}`.
And the third term , to achieve short boundaries. All the three terms are important, without anyone of them, we will always have a zero optimal trival solution.

1.1 Piecewise constant
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The paper discussed several special cases of the functional. Firstly :math:`E_{0}`, which restrict f to be a piecewise constant function.
Alors, the gradient terms of the energy function will be zero. And f(x) in each area will be the mean of g : :mean:`mean_{R_{i}}(g)` , we define :

.. math::
  E_{0}(f,\Tau) = \mu^{-2}E(f,\Tau) = \sum_{i} \int \int_{R_{i}} (g - mean_{R_{i}}g)^{2}dxdy + \frac{\nu}{\mu}\mid \Tau \mid

If :math:`\Tau` fixed , and :math:`\mu\to 0`, f minimize E tends to be a such
piecewise constant . That we have : :math:`E_{0}` **is the natural limit functional of E as** :math:`\mu \to 0`.
