Monotone Operators
==============================


Learning notes for the paper `Monotone operators and the proximal point algorithm <http://dx.doi.org/10.1137/0314056>`_ , by R. Tyrrell Rockafellar.
and `On the Douglas-Rachford splitting method and the proximal point algorithm for maximal monotone operators <Rachford_splitting_method_and_the_proximal_point_algorithm_for_maximal_monotone_operators>`_ , by Jonathan. Eckstein，Dimitri P. Bertsekas.

This paper was lined as follows:

* Definition of monntone operator :math:`T(z)`.
* Extend the basis case of variational inequalities (extend the domain to the whole space).
* Solve the problem :math:`0 \in T(z)`.
* Stop criteria, and convergence analysis.



1 Some Backgrounds
------------------------------------

**Semi-continuity**

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

**Inner product** :math:`<\cdot, \cdot>`

* Conjugate symmetric :math:`\bar{<x, y>} = <y,x>`。
* Linear in its first argument: :math:`<ax_{1} + bx_{2}, y> = a<x_{1}, y> + b<x_{2}, y>`.
* <x,x> is positive definit . i.e. <x,x> >0 if :math:`x\ne 0`, <x,x>=0 if x =0.

As a result, we have:

.. math::
  <x,ay_{1} +by_{2}> = \bar{a}<x, y_{1}> + \bar{b}<x, y_{2}>

**Notations**:

* Operator : T.
* Overload the notataion of T and its graph : :math:`T = \{ (x,y) \mid y \in T(x) \}`
* :math:`dom T  = \{ x\in H \mid \exists y\in H : (x,y) \in T \}`
* Range or Image of T : :math:`im T = \{ y\in H \mid \exists x\in H:(x,y)\in T \}`
* :math:`A+B = \{ (x, y+z) \mid (x,y)\in A, (x,z) \in B  \}`
* Identity operator I : :math:`\{ (x,x) \mid x in H \}`

2. Monotone operator
-----------------------------

**Definition Monotone** : Let H be a real Hilbert spave with inner product :math:`<\cdot, \cdot>`. A multifunction T : H :math:`\to` H is said to be a *monotone operator* if:

.. math::
  <z-z', w- w'> \ge 0 \quad whenever \quad w\in T(z), \ w'\in T(z')

It is said to be **maximal monotone** if, in addtion, the graph

.. math::
  G(T) = \{ (z, w)\in H \times H \mid w \in T(z)  \}

is not properly contained in the graph of any other monotone operator T': H :math:`\to` H.

* An operator is (maximal) monotone if and only if its inverse is (maximal) monotone.
* The best known monotone operator is the subgradient mapping :math:`\partial f` of a closed proper convex function.
* If T is a subdiffferential :math:`\partial f` of a lower semi-continuous convex function f : :math:`H \to (-\infty , +\infty], f \ne +\infty`, then T is maximal monotone, and the relation :math:`0\in T(z)` means that f(z) = min f.


**Strongly Monotone** with modulus :math:`\alpha > 0`, i.e, one have:

.. math::
  <z-z', w- w'> \ge \alpha \|z-z'\|^{2} \quad whenever \quad w\in T(z), \ w'\in T(z')

* Which means that :math:`T' = T  - \alpha I` is monotone.

**Theorem 1.** A monotone operator T on H is maximal if and only if im(I+T) = H.

**Proof**: Use Zorn's Lemma (or, equivalently the axiom of choice): that a partially ordered set containing upper
bounds for every chain (that is, every totally ordered subset) necessarily contains at least one maximal element.

**n=Nonexpansive**: An operator C on H is said to be nonexpansive if :

.. math::
  \| y'-y\| \le \|x'- x\| \quad \forall (x,y), (x',y') \in C.

* Nonexpansive operators are necessarily single-valued and Lipschitz continuous.

**Firmly Nonexpansive**: An operator J on H is said to be firmly nonexpansive if :

.. math::
  \| y'-y\|^{2} \le <x'- x, y'-y> \quad \forall (x,y), (x',y') \in J.

**Lemma 1. (Firmly Nonexpansive)** :

* All firmly nonexpansive operators are nonexpansive. (observiously)
* An operator J is firmly nonexpansive if and only if 2j-I is nonexpansive. (straightforward)
* An operator is firmly nonexpansive if and only if it is of the form :math:`(1/2)(C+I)`, where C is nonexpansive. (the inverse of the upper one)
* An operator J is firmly nonexpansive if and only if I-J is firmly nonexpansive.

**Theorem 2.** Let c be any positive scalar. An operator T on H is monotone if and only if its resolvent :math:`J_{cT} = (I+ cT)^{-1}` is
firmly nonexpansive. Furthermore, T is maximal monotone if and only if :math:`J_{cT}` is firmly nonexpansive and :math:`dom (J_{cT}) = H`.

* The purpose here is to stress the complete symmetry that exists between (maximal) monotone operators and (full-domained) firmly nonexpansive operators over any Hilbert space.

**Proof** :

.. math::
  (x,y) \in T \Leftrightarrow (x+cy, x)\in (I+cT)^{-1}

.. math::
  \begin{align*}
  T \ monotone &\Leftrightarrow <x'-x, y'-y> \ge 0 \ \forall (x,y),(x',y')\in T. \\
  & \Leftrightarrow <x'-x, cy'-cy> \ge 0 \ \forall (x,y),(x',y')\in T. \\
  & \Leftrightarrow <x'-x, cy'-cy> + \|x'-x\|^{2} \ge \|x'-x\|^{2} \ \forall (x,y),(x',y')\in T. \\
  & \Leftrightarrow <x'-x +cy'-cy, x'-x> \ge \|x'-x\|^{2} \ \forall (x,y),(x',y')\in T. \\
  & \Leftrightarrow (I+cT)^{-1} \ firmly\ nonexpansive
  \end{align*}

Clearly, T is maximal if and only if cT is maximal. So, by Theroem 1, T is maximal if and only if im(T+cI) = H. This is in turn true
if and only if :math:`(I+cT)^{-1}` has domain H, establishing the seconf statement. :math:`\square`


3 Variational Inequalities
---------------------------

The variational inequalities expression is:

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
  \begin{align*}
  L(x',y)- <x',v> + <y,u> & \ge L(x,y) - <x,v> + <y,u> \\
  & \ge L(x,y')-<x,v>+<y',u> \\
  & \forall x'\in H_{1},y'\in H_{2}
  \end{align*}

Solving the problem :math:`0 \in T_{L}(z)`, will obtain z=(x,y) such that:

.. math::
  L(x',y) \ge L(x,y) \ge L(x,y') \ \forall x'\in H_{1},y'\in H_{2}

Which is exactly the solution of the saddle point of L(x,y).

5. Algorithm
-------------------------

**Fact**: :math:`\forall z \in H, \ c > 0, \exists ! \ u \in H. \ s.t \ z-u\in cT(u)`. i.e. :math:`z\in (I + cT)(u)`

**Proof**: Suppose there exists another u' not equal to u, which satisfies the same conditions, i.e. :math:`z\in (I + cT)(u')`

.. math::
  <u-u', cT(u)- cT(u')> \ge 0

.. math::
  <u-u', (z-u)-(z-u')> \ge 0

.. math::
  <u-u', u'-u> \ge 0

.. math::
  u = u'

**Done proof**

From this fact (:math:`z\in (I + cT)(u)`), we have :

.. math::
  (I + cT)^{-1}(z) = P(z) = u

is a single-valued form H to H. and we can also prove that it is non-expansive.

As we have P(z) =z, if and only if :math:`0\in T(z)`:


**Algorithm**: :math:`z^{k+1} \approx P_{k}(z^{k}) = (I+c_{k}T)^{-1}(z^{k})`


**Case 1** : If we take T = :math:`\partial f`, we have:

.. math::
  z^{k+1} \approx P_{k}(z^{k}) = (I+c_{k}\partial f)^{-1}(z^{k})

.. math::
  z^{k+1} + c_{k}\partial f(z^{k+1}) \approx z^{k}

.. math::
  \partial f(z^{k+1}) + (1/c_{k}) (z^{k+1} -z^{k}) \approx 0

.. math::
  z^{k+1}\approx \arg\min_{z} (f(z) + (1/2c_{k})\|z - z^{k}  \|_{2}^{2})


**Case 2** : For T corresponding to a convex-concave function L , it becomes :

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

See more in the paper.

* The strong convergence is affirmative if :math:`T = \partial f` with f quadratic.
* The strong convergence is assured if :math:`c_{k}` is bounded away from zero and T is strongly monotone. In which case :math:`P_{k}' = (I + c_{k}'T')^{-1}` is nonexpansive for any :math:`c_{k} >0`  (left to prove).
