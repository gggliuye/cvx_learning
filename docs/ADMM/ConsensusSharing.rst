7. Consensus and Sharing
===============================


7.1 Global Variable Consensus
---------------------------------

**Corresponding to the distribution across samples in the next chapter**.

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
  \mathcal{L}(x,z,y) = \sum_{i=1}^{N}f_{i}(x_{i}) + y_{i}^{T}(x_{i}-z) + (\rho/2)\|x_{i} -z \|_{2}^{2})

The updates of ADMM will be :

.. math::
  \begin{align*}
  &x^{k+1}_{i} := \arg\min_{x_{i}} (f_{i}(x_{i}) + y_{i}^{kT}(x_{i}-z^{k}) + (\rho/2)\|x_{i} -z^{k} \|_{2}^{2}) \\
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
  &x^{k+1}_{i} := \arg\min_{x_{i}} (f_{i}(x_{i}) + y_{i}^{kT}(x_{i}-\bar{x}^{k}) + (\rho/2)\|x_{i} -\bar{x}^{k} \|_{2}^{2}) \\
  &z^{k+1} = \bar{x}^{k+1}\\
  &y^{k+1}_{i} := y^{k}_{i} + \rho(x^{k+1}_{i}-\bar{x}^{k+1})
  \end{align*}

7.2 Sharing
-------------------------

**Corresponding to the distribution across features in the next chapter**.

.. math::
  minimize \quad \sum_{i=1}^{N}f_{i}(x_{i}) + g(\sum_{i=1}^{N}x_{i})

In the next chapter, we will have function f corresponding to the regularization term, and g corresponding to the objective function splitted by feature subsets.

The ADMM form the equivalent problem is, where each subset corresponding to a subset of features:

.. math::
  \begin{align*}
  &minimize \quad \sum_{i=1}^{N}f_{i}(x_{i}) + g(\sum_{i=1}^{N}z_{i}) \\
  &subject\ to \quad x_{i} = z_{i}, \ i = 1,...,N
  \end{align*}

The scaled form of ADMM is :

.. math::
  \begin{align*}
  &x^{k+1}_{i} := \arg\min_{x_{i}} (f_{i}(x_{i}) + (\rho/2)\|x_{i} - z_{i}^{k} + u_{i}^{k}\|_{2}^{2}) \\
  &z^{k+1} := \arg\min_{z}(g(\sum_{i=1}^{N}z_{i}) + (\rho/2)\sum_{i=1}^{N}\|x_{i}^{k+1} - z_{i} + u_{i}^{k}\|_{2}^{2}) \\
  &u^{k+1}_{i} := u^{k}_{i} + x_{i}^{k+1} - z_{i}^{k+1}
  \end{align*}

We can further simplify the z update by the problem:

.. math::
  \begin{align*}
  &minimize g(N\bar{z}) + (\rho/2)\sum_{i=1}^{N}\|z_{i} -a_{i}\|_{2}^{2} \\
  &subject\ to \quad \bar{z} = (1/N)\sum_{i=1}^{N}z_{i}
  \end{align*}

Where :math:`a_{i} = u_{i}^{k} + x_{i}^{k+1}`, minimize the objective function while fixing the :math:`\bar{z}`, we have the lagrangian is:

.. math::
  \mathcal{L}(z_{i}, \lambda) = g(N\bar{z}) + (\rho/2)\sum_{i=1}^{N}\|z_{i} -a_{i}\|_{2}^{2} + \lambda^{T} (\bar{z} - (1/N)\sum_{i=1}^{N}z_{i})

From the first order optimal condition we have :

.. math::
  \rho (z_{i} - a_{i}) - \lambda /N =0

With the dual function d being:

.. math::
  d(\lambda) = g(N\bar{z}) + N\rho/2\|\frac{\lambda}{\rho N}\|_{2}^{2} + \lambda^{T} (\bar{z} - (1/N)\sum_{i=1}^{N}(a_{i} + \frac{\lambda}{\rho N}))

Using the first order optimal condition of the dual function :

.. math::
  (\bar{z} - \bar{a}) - \frac{lambda}{\rho N} = 0

Finally, we have :

.. math::
  z_{i} = a_{i} + (\bar{z} -\bar{a})

To solve :math:`\bar{z}`, we solve :

.. math::
  minimize \quad g(N\bar{z}) + (\rho/2)\sum_{i=1}^{N}\|\bar{z}-\bar{a}\|_{2}^{2} = g(N\bar{z}) + (N\rho/2)\|\bar{z}-\bar{a}\|_{2}^{2}

And applying the update of :math:`z_{i}` into the udpate of x , we have the ADMM udpates expression:

.. math::
  \begin{align*}
  &x_{i}^{k+1} := \arg\min_{x_{i}} (f_{i}(x_{i}) + (\rho/2)\|x_{i} - x_{i}^{k} + \bar{x}^{k} - \bar{z}^{k} + \bar{u}^{k}\|_{2}^{2}  ) \\
  &\bar{z}^{k+1} := \arg\min_{\bar{z}} (g(N\bar{z}) + (N\rho/2)\|\bar{z}-\bar{u}^{k} - \bar{x}^{k+1}\|_{2}^{2}) \\
  &\bar{u}^{k+1} := \bar{u}^{k} + \bar{x}^{k+1} - \bar{z}^{k+1}
  \end{align*}
