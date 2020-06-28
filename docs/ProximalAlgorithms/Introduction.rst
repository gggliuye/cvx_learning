Proximal Algorithms
==============================

`Link of the Site <https://moonlight-cvx-learning.readthedocs-hosted.com/en/latest>`_

This pages are my notes when learning Proxima Algorithms from the materials online, mainly from stanford engineer pages :
 `EE364b <https://web.stanford.edu/class/ee364b/lectures.html>`_ , `Proximal Algorithms <http://stanford.edu/~boyd/papers/prox_algs.html>`_,
 and `Math301 <https://statweb.stanford.edu/~candes/teaching/math301/>`_.

These pages will include the important definitions, some of my interpretations, and more derivatives and proofs than the original handouts.
These pages are corresponding with the paper `Proximal Algorithms Foundations and Trends in Optimization 2014 <http://stanford.edu/~boyd/papers/pdf/prox_algs.pdf>`_

Definitions
=========================

Proximal algorithms can be viewed as tool for non-smooth, constrained, large-sacle, or distributed problems.
The proximal operator :math:`\mathbf{prox}_{\lambda f} : \mathbf{R}^{n} \to \mathbf{R}^{n}` of f is defined by (where :math:`\lambda > 0`):

.. math::
  \mathbf{prox}_{\lambda f}(v) = \mathop{\arg\min}_{x} (f(x) + \frac{1}{2 \lambda}\| x - v \|_{2}^{2})


Generalized projections
--------------------------

When f is the indicator function:

.. math::
  \mathbf{I}_{\mathbf{C}}(x) =
  \begin{cases}
  0  \quad x \in \mathbf{C}\\
  + \infty \quad x \not\in \mathbf{C}
  \end{cases}

where :math:`\mathsrc{C}` is a closed nonempty convex set. The proximal operator of f reduces to Euclidean projection onto :math:`\mathsrc{C}` :

.. math::
  \mathbf{prox}_{\lambda \mathbf{I}_{\mathbf{C}}}(v) =
  \mathop{\arg\min}_{x} (\mathbf{I}_{\mathbf{C}}(x) + \frac{1}{2 \lambda}\| x - v \|_{2}^{2})

.. math::
  \mathbf{prox}_{\lambda \mathbf{I}_{\mathbf{C}}}(v) = \mathop{\arg\min}_{x \in \mathbf{C}} (\frac{1}{2 \lambda}\| x - v \|_{2}^{2})
   = \Pi_{\mathbf{C}}(v)

Proximal operators thus can be viewed as generalized projections.


Contents
======================

.. toctree::
   :maxdepth: 3
   :caption: Contents:

   Properties
