CVX based SLAM related algorithms
==============================

It is a summary of a few point cloud matching algorithms based on convex optimzation theory.

```mermaid
graph LR
A[SLAM problems]  --> B(2D SLAM<br>**#2.3** <br>**Loss = Difference of poses**<br>**QCQP+Lagrangian duality**)
A--> C(3D SLAM<br>**#2.4** <br>**Loss = Difference of poses**<br>**QCQP+Lagrangian duality**)
A--> D(More general<br>**#1.2**<br>**Multiview Geometry Problems**<br>**Fractional Programming+Convex Envelope**)
```

```mermaid
graph LR
A[Point cloud registration]  --> B(BnB method <br>**global optimal**)
B-->E(#1.2<br>**QCQP+Lagrangian duality**)
B-->F(#1.1<br>**Fractional Programming+Convex Envelope**)
A--> C(Relaxation method <br>**tight empirically** <br>**For SO3 constraint of rotation**)
C--> D(Matrix Representation <br>**#2.1 #2.2**)
C--> G(Quaternion Representation <br>**#3** <br>**The only correspondence free method here**)
```
