7. Consensus and Sharing
===============================


7.1 Global Variable Consensus
---------------------------------

Consider the problem with one single objective function, but can be distributed into several parts:

.. math::
  minimize \quad f(x) = \sum_{i=1}^{N}f_{i}(x)

We can always extend the definition of the function :math:`f_{i}` to be plus infinity if x is out of its domain.
The advantage of ADMM is that each split of the objective function could be implemented into different processors, such
that the algorithm could run in parallex.

Then we can rewrite the problem into a **global consensus problem** (since that the constraints are that all the local variables should agree) :

.. math::
  \begin{align*}
  &minimize \quad \sum_{i=1}^{N}f_{i}(x_{i}) \\
  &subject\ to \quad x_{i} = z, \ i = 1, ..., N
  \end{align*}

The augmented Lagrangian is :

.. math::
  \mathcal{L}(x,z,y) = \sum_{i=1}^{N}f_{i}(x_{i} + y_{i}^{T}(x_{i}-z) + (\rho/2)\|x_{i} -z \|_{2}^{2})

The updates of ADMM will be :

.. math::
  \begin{align*}
  &x^{k+1}_{i} := \arg\min_{x_{i}} (f_{i}(x_{i} + y_{i}^{kT}(x_{i}-z^{k}) + (\rho/2)\|x_{i} -z^{k} \|_{2}^{2}) \\
  &z^{k+1} := \arg\min_{z} \sum_{i=1}^{N}(y_{i}^{kT}(x_{i}^{k+1}-z) + (\rho/2)\|x_{i}^{k+1} -z \|_{2}^{2}) \\
  &y^{k+1}_{i} := y^{k}_{i} + \rho(x^{k+1}_{i}-z^{k+1})
  \end{align*}

The update of z could be further simplified by :

.. math::
  \begin{align*}
  z^{k+1} &= \arg\min_{z} \sum_{i=1}^{N}(y_{i}^{kT}(x_{i}^{k+1}-z) + (\rho/2)\|x_{i}^{k+1} -z \|_{2}^{2}) \\
  &= \arg\min_{z} \sum_{i=1}^{N} - (y_{i}^{k} +\rho x_{i}^{k+1})^{T}z + (\rho/2)Nz^{T}z
  \end{align*}

.. math::
  z^{k+1} = (1/N)\sum_{i=1}^{N}(x_{i}^{k+1} + (1/\rho)y_{i}^{k})

we can further simpliy it by introcuding the notation of averages:

.. math::
  z^{k+1} := \bar{x}^{k+1} + (1/\rho)\bar{y}^{k}

.. math::
  \bar{y}^{k+1} := \bar{y}^{k}_{i} + \rho(\bar{x}^{k+1}-z^{k+1}) = 0

So we have :

.. math::
  z^{k+1} := \bar{x}^{k+1}

Finally we have the ADMM updates:

.. math::
  \begin{align*}
  &x^{k+1}_{i} := \arg\min_{x_{i}} (f_{i}(x_{i} + y_{i}^{kT}(x_{i}-\bar{x}^{k}) + (\rho/2)\|x_{i} -\bar{x}^{k} \|_{2}^{2}) \\
  &z^{k+1} = \bar{X}^{k+1}\\
  &y^{k+1}_{i} := y^{k}_{i} + \rho(x^{k+1}_{i}-\bar{x}^{k+1})
  \end{align*}
