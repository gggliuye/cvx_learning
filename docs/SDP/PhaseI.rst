6. Phase I and Phase I-II methods
==================================

**Phase I** : find a strictly feasible starting point.

6.1 Gig-M method
----------------------------

6.1.1 Case 1
~~~~~~~~~~~~~~~~~~~~

**Case 1** : A strictly feasible x is known, but no strictly feasible Z.

Take a large enough M ,  to forme an additional constraint to the primal problem (without loss of generality):

.. math::
  \begin{align}
  minimize \quad & c^{T}x \\
  subject\ to \quad & F(x) \ge 0, \ Tr(F(x)) \le M.
  \end{align}

The duality of this modified problem is :

.. math::
  \begin{align*}
  maximize\quad &-Tr(F_{0}(Z-\tau I))-M\tau \\
  subject\ to \quad &Tr(F_{i}(Z-\tau I)) = c_{i}, i=1,...m, \\
  & Z \ge 0, \ \tau \ge 0, \ Z^{T} = Z \in \mathbb{R}^{n\times n}
  \end{align*}

We can easily find a strictly feasible point for this problem.
By firstly found any :math:`U=U^{T}` such that :math:`Tr(F_{i}U)=c_{i}` (which does not require U to be positive semidefine) .
Then we define :math:`\tau^{(0)} > - \min \{\lambda_{min}(U), 0 \}`, along with :math:`Z^{(0)} = U + \tau^{(0)}I`.
Which will assure Z to be positive-definite.
With this method we could easily get a starting point for x and Z.

The difficulty is the choice of M. We need to check if the constraint of M is activated at
the solution of the modified problem. Then choose to modify M.


6.1.2 Case 2
~~~~~~~~~~~~~~~~~~~~~~~~

**Case 2** : A strictly feasible Z is known, but no strictly feasible x.

Adding the big-M term to the primal objective :

.. math::
  \begin{align}
  minimize \quad & c^{T}x + Mt\\
  subject\ to \quad & F(x)+tI \ge 0, \ t\ge 0.
  \end{align}

Then choose any :math:`x^{(0)}`, and take :

.. math::
  t^{(0)} > - \min\{\lambda_{min}(F(x^{(0)})), 0 \}

The dual problem of it is :

.. math::
  \begin{align*}
  maximize\quad &-Tr(F_{0}Z) \\
  subject\ to \quad &Tr(F_{i}Z) = c_{i}, i=1,...m, \\
  & Tr(Z) + \tau = M \\
  & Z\ge 0, \ \tau \ge 0,
  \end{align*}

Eliminate the slack variable :math:`\tau` :

.. math::
  \begin{align*}
  maximize\quad &-Tr(F_{0}Z) \\
  subject\ to \quad &Tr(F_{i}Z) = c_{i}, i=1,...m, \\
  & Tr(Z) \le M
  \end{align*}

Which is the modified SDP dual problem by adding an upper bound on the trace of Z.

6.1.3 Case 3
~~~~~~~~~~~~~~~~~~~~~

**Case 3** : Neither a strictly feasible x nor a strictly feasible Z is known.

We will combine the two upper cases, to forme the modified primal problem as :

.. math::
  \begin{align}
  minimize \quad & c^{T}x + M_{1}t\\
  subject\ to \quad & F(x)+tI \ge 0, \ t\ge 0,\\
  & Tr(F(x)) \le M_{2}
  \end{align}

And the dual become :

.. math::
  \begin{align*}
  maximize\quad &-Tr(F_{0}(Z-\tau I))-M_{2}\tau \\
  subject\ to \quad &Tr(F_{i}(Z-\tau I)) = c_{i}, i=1,...m, \\
  & Z \ge 0, \ \tau \ge 0, \\
  & Tr(Z) \le M_{1}.
  \end{align*}

6.2 Others
--------------------

Other methods can start from a infeasible points and do not require big-M terms.
