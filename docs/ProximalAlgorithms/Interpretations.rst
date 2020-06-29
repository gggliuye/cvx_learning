Interpretations
==============================


Moreau-Yosida regularization
------------------------------

From the name we can know that, this interpretation is closely related to the Moreau decomposition.
And the proximal operator has the same formula as the moreau-vosida regularization.

**Definition 3.1**: The **infimal convolution** of closed proper convex function f and g on :math:`\mathbb{R}^{n}`, denoted :math:`f \square g`
is defined as :

.. math::
  (f \square g)(v) = \inf_{x}(f(x) + g(v-x))

with :math:`\mathbf{dom}(f\square g) = \mathbf{dom}f + \mathbf{g}`

The main example related is the **Moreau envelope** or **Moreau-Yosida regularization** :math:`M_{\lambda f}` of the function :math:`\lambda f`,
(which has the same definition as :math:`\bar f_{\mu}` in the page "Proerties", the proof of Moreau decomposition) is defined as:

.. math::
  M_{\lambda f}(v) =  \lambda f \square  (1/2)\| \cdot \|^{2}_{2}

.. math::
  M_{\lambda f}(v) = \inf_{x}(f(x) + (1/2lambda) \| x- v\|^{2}_{2})

Convexity
~~~~~~~~~~~~~~~~~~~~~~

Note :math:`L(x,y) = f(y) + \frac{1}{2*\mu} \| x- y\|^{2}_{2}`, then  is jointly convex in x and y, Then :math:`M_{\lambda f}(v) = \inf_{y}L(x,y)`
must be convex (since its epigraph is the projection of a convex set).


Smoothed or Regularized form of f
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Theorem 3.2** : :math:`(f \square g)^{*} = f^{*} + g^{*}`.

**Proof of Theorem 3.2** :

.. math::
  \begin{align*}
  (f\square g)^{*}(x) &= \sup_{u}(y^{T}u - (f\square g)(u)) \\
  &= \sup_{u}(y^{T}u - \inf_{v}(f(v) + g(u-v))) \\
  &= \sup_{u} \sup_{v} (y^{T}u - f(v) - g(u-v)) \\
  & \quad ( t \triangleq u - v \Rightarrow u = t+v) \\
  &= \sup_{t}sup_{v}(y^{T}(t+v) - f(v) - g(t)) \\
  &= \sup_{t}(y^{T}t -g(t)) + \sup_{v}(y^{T}v - f(v))\\
  &= f^{*} + g^{*}
  \end{align*}

**Proof of Theorem 3.2 with duality** :

First, we can reform the Moreau envelope as a equation constrained convex optimization problem:

.. math::
  \begin{align*}
  M_{\lambda f}(x) &= \inf_{y}(f(y) + (1/2\lambda)\|x-y\|^{2}) \\
  &= \inf_{y, s.t. x=y=z}(f(y) + (1/2\lambda)\|z\|^{2})
  \end{align*}

The largangian of this problem is :

.. math::
  \begin{align*}
  \mathbb{L}(y,z,\mu) &= f(y) + (1/2\lambda)\|z\|^{2} + \mu^{T}(x-y-z) \\
  &=(f(y)- \mu^{T}y) + ((1/2\lambda)\|z\|^{2} - \mu^{T}z) + \mu^{T}x
  \end{align*}

The dual problem is :

.. math::
  \begin{align*}
  g(\mu) &= \inf_{y,z} \mathbb{L}(y,z,\mu) \\
  &= - \sup_{y}(\mu^{T}y - f(y)) - (\lambda/2)\|\mu\|^{2} + \mu^{T}x \\
  &= - f^{*}(\mu) - (\lambda/2)\|\mu\|^{2} + \mu^{T}x
  \end{align*}

As strong duality holds for strickly feasible convex optimization problem, we have the dualty gap equals zero:

.. math::
  \begin{align*}
  M_{\lambda f}(x) &= \sup_{\mu} g(\mu)\\
  &= \sup_{\mu} (-f^{*}(\mu) - (\lambda/2)\|\mu\|^{2} + \mu^{T}x) \\
  &= (f^{*} + (\lambda/2)\|\cdot\|^{2})^{*}(x)
  \end{align*}


As a result of Theorem 3.2, we have :

.. math::
  \begin{align*}
  M_{\lambda f} = M_{\lambda f}^{**} &= (f \square (1/2\lambda)\|\cdot\|^{2}_{2})^{**} \\
  &= (f^{*} + ( (1/2\lambda)\|\cdot\|^{2}_{2})^{*})^{*} \\
  & \quad (\|\cdot\|^{2}_{2} \quad is \quad self-dual) \\
  &=(f^{*} +  (1/2\lambda)\|\cdot\|^{2}_{2})^{*}
  \end{align*}

From the upper equation, we can interperte the Moreau envelope :math:`M_{\lambda f}` as a smooth approximation to a function
by taking its conjugate, adding regulization. Mreau envelope obtains a smooth approximation via:

1. Take the conjugate of f : :math:`f^{*}`.

2. Regularize : :math:`f^{*} +  (1/2\lambda)\|\cdot\|^{2}_{2}`

3. Take the conjugate again : :math:`(\cdot)^{*} = M_{\lambda f}`

Moreau envelope of L1 norm
~~~~~~~~~~~~~~~~~~~~~~~~~

Moreau envelope of :math:`\mid \cdot \mid` is the Huber function:

.. math::
  \begin{align*}
  M_{L1} &= (\mid \cdot \mid^{*} + (1/2)\|x\|^{2}_{2})^{*}\\
  &=\sup_x(x^{T}y - \sup_{v}(-\mid v\mid + v^{T}x) - (1/2)\|x\|^{2}_{2})
  \end{align*}

Consider firstly the variable v:

.. math::
  \sup_{v \ge 0} ( - \mid v \mid + v^{T}x) =
  \begin{cases}
  0  \quad x < 1\\
  + \infty \quad x >1
  \end{cases}

.. math::
  \sup_{v \le 0} ( - \mid v \mid + v^{T}x) =
  \begin{cases}
  0  \quad x > -1\\
  + \infty \quad x < -1
  \end{cases}

In summary :

.. math::
  k(x) = \sup_{v} ( - \mid v \mid + v^{T}x) =
  \begin{cases}
  0  \quad \mid x\mid < 1\\
  + \infty \quad \mid x \mid >1
  \end{cases}

And:

.. math::
  M_{L1} =\sup_x(-\frac{1}{2}(x-y)^{2} - k(x) + (1/2)y^{2})

* If :math:`\mid y \mid \le 1`, take :math:`x=y`, :math:`\mid x \mid \le 1`, :math:`k(x) = 0`, We will have :math:`M_{L1} = \frac{1}{2}y^{2}`.

* If :math:`\mid y \mid \ge 1`, :math:`\mid x \mid \ge 1`, :math:`k(x) = \infty`, we should also take :math:`\mid x \mid \le 1`, as a result :math:`\mid x \mid = 1`. We will have :math:`M_{L1} = \mid y \mid - \frac{1}{2}`

We end up with **Huber function**.


Gardient of Moreau envelope
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Consider the definition of Proximal operator, we have :

.. math::
  M_{\lambda f}(x) = f(\mathbf{prox}_{\lambda f}(x)) + \frac{1}{2\lambda}\| x - \mathbf{prox}_{\lambda f}(x)\|^{2}_{2}

To find the gradient of Moreau envelope, we reform the expression first:

.. math::
  \begin{align*}
  M_{\lambda f}(x) &= \inf_{y}(f(y) + (1/2\lambda)\|y-x\|^{2}_{2})  \\
  &=\inf_{y}(f(y) + (1/2\lambda)(\|x\|^{2} + \|y\|^{2} - 2x^{T}y))  \\
  &= (1/2\lambda)\|x\|^{2} + (1/\lambda) \inf_{y}(\lambda f(y) - x^{T}y + (1/2)\|y\|^{2})  \\
  &= (1/2\lambda)\|x\|^{2} - (1/\lambda) \sup_{y}(-\lambda f(y) + x^{T}y - (1/2)\|y\|^{2})  \\
  &= (1/2\lambda)\|x\|^{2} - (1/\lambda) (\lambda f + (1/2)\|\cdot\|^{2})^{*}(x)
  \end{align*}

Then take the gradient of both sides, we will have :

.. math::
  \begin{align*}
  \Delta M_{\lambda f}(x) &= x/\lambda - (1/\lambda)\arg\max_{y}(x^{T}y - \lambda f(y) - (1/2)\|y\|^{2}) \\
  & (as \quad x_{best} \in \partial f^{*}(y) \quad from \quad Properties \quad page) \\
  &= (1/\lambda)(x- \mathbf{prox}_{\lambda f}(x))
  \end{align*}

.. math::
  \mathbf{prox}_{\lambda f}(x) = x- \lambda \Delta M_{\lambda f}(x)

The proximal operator is a **gradient update step** of a smoothed version of f, with step size :math:`\lambda`.
