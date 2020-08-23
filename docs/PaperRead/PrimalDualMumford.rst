Primal-Dual Mumford-Shah
===========================================

1. Mumford-Shah Functional
---------------------------------------

Firstly, we introduce the **Mumford-Shah Functional** from paper `Optimal approximations by piecewise smooth functions and associated variational problems <https://dash.harvard.edu/bitstream/handle/1/3637121/Mumford_OptimalApproxPiece.pdf?sequence%3D1>`_

We have the g the "image" data, whose domain is in :math:`R\subset \mathbb{R}^{2}`, and f : :math:`\cup R_{i \to \mathbb{R}}` a differentiable smooth function on :math:`\cup R_{i}`

Here we consider to segment the image into :math:`\{ R_{i}\}`, disjoint connected open subsets of R. :math:`\Gamma` will be the
union of the part of the boundary of :math:`R_{i}` inside R, so that :

.. math::
  R = R_{1}\cup R_{2}\cup .. \cup R_{n}\cup \Gamma

And the **Mumford-Shah Function** is defined as a energy function:

.. math::
  E(f, \Gamma) = \mu^{2} \int \int_{R}(f-g)^{2}dxdy + \int \int _{R\setminus \Gamma}\|\triangledown f \|^{2}dxdy + \nu \mid \Gamma\mid

Where we have the first term: to ensure f is close to g. The second term: that f is smooth within the region :math:`R_{i}`.
And the third term , to achieve short boundaries. All the three terms are important, without anyone of them, we will always have a zero optimal trival solution.

1.1 Piecewise constant
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The paper discussed several special cases of the functional. Firstly :math:`E_{0}`, which restrict f to be a piecewise constant function.
Alors, the gradient terms of the energy function will be zero. And f(x) in each area will be the mean of g : :math:`mean_{R_{i}}(g)` , we define :

.. math::
  E_{0}(f,\Gamma) = \mu^{-2}E(f,\Gamma) = \sum_{i} \int \int_{R_{i}} (g - mean_{R_{i}}g)^{2}dxdy + \frac{\nu}{\mu}\mid \Gamma \mid

If :math:`\Gamma` fixed , and :math:`\mu\to 0`, f minimize E tends to be a such
piecewise constant . That we have : :math:`E_{0}` **is the natural limit functional of E as** :math:`\mu \to 0`.

In this case, it will be a **The Plateau problem** .

1.2 :math:`E_{\infty}`
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. image:: images/geodesic.PNG
   :align: center

The authors also descussed :math:`E_{\infty}` :

.. math::
  \begin{align}
  E_{\infty} &= \int_{\Gamma}[\nu_{\infty} - (\frac{\partial g}{\partial n})^{2}]ds \\
  &= \int_{\Gamma}\rho(dx, dy, x, y) \\
  &= \int_{\Gamma} \frac{\nu_{\infty} (dx^{2}+dy^{2}) - (g_{x}dy + g_{y}dx)^{2} }{\sqrt{dx^{2} + dy^{2}}}
  \end{align}

**Generalized deodesic problem** :

* :math:`E_{\infty}` tends to make length of :math:`\Gamma` as short as possible.
* :math:`E_{\infty}` tends to make g has the largest possible derivative when normal to :math:`\Gamma`.

If we define the solution f to be g when far from the boundaries and take :math:`f_{\infty}` when very close to :math:`\Gamma` :

.. math::
  f_{\infty}(r,s) = g(r,s) + \epsilon sgn(r)\exp(-\mid r\mid / \epsilon)\frac{\partial g}{\partial r}(0,s)

Where :math:`\mu = 1/\epsilon, \ \nu = \epsilon \nu_{infty}`, With this f function, we will have :

.. math::
  E(f_{\infty}, \Gamma) = E(g, \phi) + \epsilon E_{\infty}(\Gamma) + O(\epsilon^{2})

While :math:`\mu \to \infty` we will have :math:`\epsilon \to 0`.
That we have : :math:`E_{\infty}` **is the natural limit functional of E as** :math:`\mu \to \infty`.

2. Convex Relaxation
---------------------------------

This convex relaxation is introduced by `An algorithm for minimizing the mumford-shah functional <https://ieeexplore.ieee.org/document/5459348>`_
Which is also the basic for chapter 3, in this page.

The notaion of Mumford-Shah functional in this article:

.. math::
  E(u) = \lambda \int_{\Omega}(f-u)^{2}dx + \int_{\Omega\setminus S_{u}} \mid\triangledown u\mid^{2}dx + \nu \mathcal{H}^{1}(S_{u})

Where we have f the known observation of the image, :math:`f:\Omega\subset \mathbb{R}^{2} \to \mathbb{R}`, and :math:`u:\Omega\to\mathbb{R}` a piece wise smooth function (our desired solution).

I skip the related works here, as I haven't read them.

**Step 1** : this article try to reform the formule of Mumford-Shah functional, by defining :math:`u\in SBV(\Omega)` , the special functions of bounded variation [1]_ .
And define the upper level sets of u by the characteristic function :math:`\mathbf{1}_{u} : \Omega \times \mathbb{R}\to \{0,1\}` of the subgraph of u :

.. math::
  \mathbf{1}_{u}(x,t) = \begin{cases} 1, \quad if \ t < u(x) \\
  0, \quad else \end{cases}

.. image:: images/sbv.PNG
   :align: center
   :width: 50%

**Step 2 : Theorem 1.** For a function :math:`u\in SBV(\Omega)` the Mumford-Shah functional can be
written as :

.. math::
  E(u) = \sup_{\varphi \in K}\int_{\Omega\times \mathbb{R}}\varphi D\mathbf{1}_{u}

with a convex set :

.. math::
  \begin{align}
  K = & \{  \varphi\in C_{0}(\Omega\times \mathbb{R}; \mathbb{R}^{2}): \\
  & \varphi^{t}(x,t) \ge \frac{\varphi^{x}(x,t)^{2}}{4} - \lambda (t-f(x))^{2}, \\
  &\mid \int_{t_{1}}^{t_{2}} \varphi^{x}(x,s)ds \mid \le \nu , x\in \Omega , t, t_{1}, t_{2}\in \mathbb{R} \},
  \end{align}

**Proof Theorem 1.** : First we observe that the right hand part, the intergration, is a integration of changement of the space :math:`\Omega\times \mathbb{R}`,
It is equivalent to the intergraion of the energy flow on the boundary (the normal of the function at boundaries :math:`\nu_{\Gamma_{u}}`):

.. math::
  \int_{\Omega\times \mathbb{R}}\varphi D\mathbf{1}_{u} = \int_{\Gamma_{u}}\varphi\cdot \nu_{\Gamma_{u}}d\mathcal{H}^{2}

.. math::
  \nu_{\Gamma_{u}} = \begin{cases}
  \frac{(\triangledown u, -1)}{\sqrt{\mid\triangledown u \mid^{2} +1}}, \quad if\ u \in \Omega\setminus S_{u} \\
  (\nu_{u},0), \quad \quad if\ u \in S_{u}
  \end{cases}

As in the boundary :math:`\Omega\setminus S_{u}`, we have the gradient w.r.t. t zero, and w.r.t. x :math:`\triangledown u`. And in :math:`S_{u}`, we have
the gradient w.r.t. t zero, and w.r.t. x the unit vector pointing from outside to inside.

.. [1] i.e. functions u of bounded variation for which the derivative Du is the sum of an absolutely  continuous part :math:`\triangledown u \cdot dx` and a discontinuous singular part :math:`S_{u}`, see Figure 2.
