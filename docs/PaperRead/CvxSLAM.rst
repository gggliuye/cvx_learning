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

**Ordinary Gaussian noise model**

.. math::
  p(x|x') =  \frac{1}{2 \pi \sigma^{2}} \exp( - \frac{ \| x - x' \|^{2}_{2}}{2\sigma^{2}})

**A special case for Laplace nosie**

.. math::
  p(x|x') =  \frac{1}{2 \pi \sigma} \exp( - \frac{ \| x - x' \|_{2}}{\sigma})

**Bivariate Laplace distribution**

.. math::
  p(x|x') =  \frac{1}{4 \sigma} \exp( - \frac{ \| x - x' \|_{1}}{\sigma})

.. image:: https://img-blog.csdnimg.cn/20200608151450625.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDQ5MjAyNA==,size_16,color_FFFFFF,t_70
    :align: center

* it shows that the tridational method (Bundle Adjustment method) for point cloud match is very senstive to noise, and easily trapped in local minimal. While BNB method find a global optimal is apparent much better.

* And it shows that **L2 Guassian noise model** shows better result for camera resectioning (the least reprojection error). While **L1 Laplacian model** shows better result for ICP type problems.

* And from the Table2, we can see a real **L1 norm** will conerge much faster. (It may be true that the 21 centry is the centry for L1 norm)

1.2 Branch-and-Bound Methods for Euclidean Registration Problems
------------------------------------------

`Article <https://www.researchgate.net/publication/24213723_Branch-and-Bound_Methods_for_Euclidean_Registration_Problems?enrichId=rgreq-9861f218523209ac6405a5bec452f72f-XXX&enrichSource=Y292ZXJQYWdlOzI0MjEzNzIzO0FTOjEwNDUxNzU1OTM5MDIwOUAxNDAxOTMwMzM2MDg0&el=1_x_3&_esc=publicationCoverPdf>`_

This is a article focus on the 3D points registration problems, which needs already matched point pairs.
The lower bounds are obtained by Convex relaxations of :math:`\mathbf{SO}(3)`, which is the rotation part.
It uses quaternion expression of the rotation. And apply a convex envelop over :math:`q_{i}q_{j}`.

* It shows a much better result compared to linear algebra methods (DLT), and have a competable result compared to DLT + bundle adjustment.
* It is much much more stable compared to the other methods.
* While even though they didn't show, I think the comptation time it needs is much more than the other two methods.

2. Lagrangian Duality
================================
