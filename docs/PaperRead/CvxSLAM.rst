CVX based SLAM related algorithms
==============================

It is a summary of a few point cloud matching algorithms based on convex optimzation theory.

.. mermaid::
  graph LR
  A[SLAM problems]  --> B(2D SLAM<br>**#2.3** <br>**Loss = Difference of poses**<br>**QCQP+Lagrangian duality**)
  A--> C(3D SLAM<br>**#2.4** <br>**Loss = Difference of poses**<br>**QCQP+Lagrangian duality**)
  A--> D(More general<br>**#1.2**<br>**Multiview Geometry Problems**<br>**Fractional Programming+Convex Envelope**)

.. mermaid::
  graph LR
  A[Point cloud registration]  --> B(BnB method <br>**global optimal**)
  B-->E(#1.2<br>**QCQP+Lagrangian duality**)
  B-->F(#1.1<br>**Fractional Programming+Convex Envelope**)
  A--> C(Relaxation method <br>**tight empirically** <br>**For SO3 constraint of rotation**)
  C--> D(Matrix Representation <br>**#2.1 #2.2**)
  C--> G(Quaternion Representation <br>**#3** <br>**The only correspondence free method here**)


1. Banch and Bound
==========================

1.1 Practical Global Optimization for Multiview Geometry
--------------------------------------------------
`Article <http://www.researchgate.net/profile/Serge_Belongie/publication/225439941_Practical_Global_Optimization_for_Multiview_Geometry/links/0fcfd5086e4e7aa60f000000>`_

This article talks about using Banch and Bound algorithm for three types of Multiview Geometry problems:
* Camera pixels triangualtion
* Camera Resectioning, which is to estimate camera matrix P.
* Projection from :math:`\mathbf{P}^{n}` to :math:`\mathbf{P}^{m}`, which could be homography estimation and use 3d point matches to estiamte relative transformation.

This article uses :

* Fractinal Programming to reform these problems
* Using Convex Envelope of these Fractinal problems as a lower bound for Banch and Bound
* Use three type of nosie models :
** Ordinary Gaussian noise model :
.. math::
  p(x|x') =  \frac{1}{2 \pi \sigma^{2}} \exp( - \frac{ \| x - x' \|^{2}_{2}}{2\sigma^{2}})

** A special case for Laplace nosie
.. math::
  p(x|x') =  \frac{1}{2 \pi \sigma} \exp( - \frac{ \| x - x' \|_{2}}{\sigma})

** Bivariate Laplace distribution
.. math::
  p(x|x') =  \frac{1}{4 \sigma} \exp( - \frac{ \| x - x' \|_{1}}{\sigma})
