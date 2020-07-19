Monotone Operators
==============================


Learning notes for the paper *Monotone operators and the proximal point algorithm*, by R. Tyrrell Rockafellar.

This paper was lined as follows:

* Definition of monntone operator :math:`T(z)`.
* Extend the basis case of variational inequalities (extend the domain to the whole space).
* Solve the problem :math:`0 \in T(z)`.
* Stop criteria, and convergence analysis.



1 Some Backgrounds
------------------------------------

*Semi-continuity*

(See more from the wiki page) *Semi-continuity* is a property of extended real-valued functions (it is weaker than continuity) .

**Definition** : Suppose X a topogical space, :math:`x_{0}` is a point in X. And function f : :math:`X \to \mathbb{R} \cup \{ -\infty , \infty \}` is a
entended real-valued function. f is called *upper semi-continuous* at :math:`x_{0}`, if for every :math:`y > f(x_{0})` there exists a neighborhood U of :math:`x_{0}`
such that :math:`f(x)<y`, for all :math:`x\in U`.

* Metric space : :math:`\lim_{x\to x_{0}}\sup f(x) \le f(x_{0})`.
* Floor function is an upper semi-continuous function, ceilling function is a lower semi-continuous function.

This article proposed a method for solving a lower semi-continuous proper convex function on a Hilbert space, by iterative taking :

.. math::
  z^{k+1} := P(z^{k})

More precisly :

.. math::
  z^{k+1} := \arg\min_{z} (f(z) + (1/2c_{k})\|z - z^{k}\|^{2}_{2})

With :math:`c_{k} > 0`.

*Inner product* :math:`<\cdot, \cdot>`

* Conjugate symmetric :math:`\bar{<x, y>} = <y,x>`。
* Linear in its first argument: :math:`<ax_{1} + bx_{2}, y> = a<x_{1}, y> + b<x_{2}, y>`.
* <x,x> is positive definit . i.e. <x,x> >0 if :math:`x\ne 0`, <x,x>=0 if x =0.

As a result, we have:

.. math::
  <x,ay_{1} +by_{2}> = \bar{a}<x, y_{1}> + \bar{b}<x, y_{2}>

2. Monotone operator
-----------------------------

*Definition* : Let H be a real Hilbert spave with inner product :math:`<\cdot, \cdot>`. A multifunction T : H :math:`\to` H is said to be a *monotone operator* if:

.. math::
  <z-z', w- w'> \ge 0 \quad whenever \quad w\in T(z), \ w'\in T(z')

It is said to be *maximal monotone* if, in addtion, the graph

.. math::
  G(T) = \{ (z, w)\in H \times H \mid w \in T(z)  \}

is not properly contained in the graph of any other monotone operator T': H :math:`\to` H.

* If T is a subdiffferential :math:`\partial f` of a lower semi-continuous convex function f : :math:`H \to (-\infty , +\infty], f \ne +\infty`, then
T is maximal monotone, and the relation :math:`0\in T(z)` means that f(z) = min f.

3 Variational Inequalities
---------------------------

.. math::
  T(z) = \begin{cases}
  T_{0}(z) + N_{D}(z) \quad if \ z \in D, \\
  \varnothing \quad if \ z \notin D
  \end{cases}

Where D is a nonempty closed convex subset of H, and :math:`T_{0} : D \to H` is single-valued, monotone and hemicontinuous (i.e. continuous along each linear
segment in H with respect to the weak topology), and :math:`N_{D}(z)` is the *normal cone* to D at z :

.. math::
  N_{D}(z) = \{ w \in H \mid <z-u, w>\ge 0, \forall u \in D \}

We can prove that this T is maximal monotone.

The problem :math:`0 \in T(z)` reduce to :math:`-T_{0}(z) \in N_{D}(z)`, or :

.. math::
  z\in D \ and \ <z-u, T_{0}(z)> \le 0 \ \forall u\in D

If D is a cone, this condition will be the *complementary problem*:

.. math::
  z\in D, -T_{0}(z)\in D^{\circ} \ and \ <z,T_{0}(z)> = 0

4. Lagrangian
-----------------------

Another example corresponding to saddle point optimization. Let H be the product of two Hilbert spaces, :math:`H = H_{1}\times H_{2}`,
and let :math:`L: H \to [-\infty , +\infty]` be such that L(x,y) is convex in :math:`x\in H_{1}`, and concave in :math:`y\in H_{2}`.
Which is exactly the case for a normal lagrangian function for a constrained convex optimization problem, where x is the primal variable,
and y is the dual variable. Solve the problem is the find the saddle point the lagrangian function.

We build another operator :math:`T_{L}(z)` the be the set of all w = (v,u) such that:

.. math::
  L(x',y)- <x',v> + <y,u> \ge L(x,y) - <x,v> + <y,u> \ge L(x,y')-<x,v>+<y',u> \ \forall x'\in H_{1},y'\in H_{2}

Solving the problem :math:`0 \in T_{L}(z)`, will obtain z=(x,y) such that:

.. math::
  L(x',y) \ge L(x,y) \ge L(x,y') \ \forall x'\in H_{1},y'\in H_{2}

Which is exactly the solution of the saddle point of L(x,y).

5. Algorithm
-------------------------

*Fact*: :math:`\forall z \in H, \ c > 0, \exists ! \ u \in H. \ s.t \ z-u\in cT(u)`. i.e. :math:`z\in (I + cT)(u)`

*Proof*: Suppose there exists another u' not equal to u, which satisfies the same conditions, i.e. :math:`z\in (I + cT)(u')`

.. math::
  <u-u', cT(u)- cT(u')> \ge 0

.. math::
  <u-u', (z-u)-(z-u')> \ge 0

.. math::
  <u-u', u'-u> \ge 0

.. math::
  u = u'

**Done proof.**

From this fact (:math:`z\in (I + cT)(u)`), we have :

.. math::
  (I + cT)^{-1}(z) = P(z) = u

is a single-valued form H to H. and we can also prove that it is non-expansive.

As we have P(z) =z, if and only if :math:`0\in T(z)`:

5.1 Algorithm
~~~~~~~~~~~~~~~~~~~~~~~~~~

*Algorithm*: :math:`z^{k+1} \approx P_{k}(z^{k}) = (I+c_{k}T)^{-1}(z^{k})`

5.2 Case 1 : partial derivative
~~~~~~~~~~~~~~~~~~~~~~~~~~

*Case 1* : If we take T = :math:`\partial f`, we have:

.. math::
  z^{k+1} \approx P_{k}(z^{k}) = (I+c_{k}\partial f)^{-1}(z^{k})

.. math::
  z^{k+1} + c_{k}\partial f(z^{k+1}) \approx z^{k}

.. math::
  \partial f(z^{k+1}) + (1/c_{k}) (z^{k+1} -z^{k}) \approx 0

.. math::
  z^{k+1}\approx \arg\min_{z} (f(z) + (1/2c_{k})\|z - z^{k}  \|_{2}^{2})

5.3 Case 2: convex-concave
~~~~~~~~~~~~~~~~~~~~~~~~

For T corresponding to a convex-concave function L , it becomes :

.. math::
  (x^{k+1}, y^{k+1}) \approx \arg minimax_{x,y} \Lambda_{k}(x,y)

.. math::
  \Lambda_{k}(x,y) = L(x,y) + \frac{1}{2c_{k}}\|x-x^{k}\|^{2}_{2} - \frac{1}{2c_{k}}\|y-y^{k}\|^{2}_{2}

6. Stop Criteria
-------------------------

A :

.. math::
  \|z^{k+1} - P_{k}(z^{k}) \| \le \varepsilon_{k}, \quad \sum_{k=0}^{\infty} \varepsilon_{k} < \infty

B :

.. math::
  \|z^{k+1} - P_{k}(z^{k}) \| \le \delta_{k}\|z^{k+1} -z^{k}\|, \quad \sum_{k=0}^{\infty} \delta_{k} < \infty

7. Applications
-------------------------

* :math:`T = \partial f`, f is the essential objective function in the problem.
* :math:`T = - \partial g`, f is the concave objective function in the dual problem.
* :math:`T_{L}` corresponding to the convex-concave Largrangian function.

8. Convergence
----------------------

See the paper.
