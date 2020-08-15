5. Primal-dual potential reduction methods
=============================================


5.1  General Description
-----------------------------

The potential function is defined below, where is a summary of log of the duality gap, and the derivation from the
analytic center.

.. math::
  \begin{align}
  \phi(x, Z) &= \mu\sqrt(n) \log(Tr(F(x)Z)) + \psi(x, Z) \\
  & = (n+ \mu\sqrt(n)) \log(Tr(F(x)Z)) - \log\det F(x)Z - n\log n
  \end{align}

As :math:`\psi > 0`, we have :math:`\eta \le \exp(\psi/(\mu\sqrt(n)))`, therefore if the potential funcion value is small,
the duality gap must be small.

The potential reduction method will be a method to iteratively update x and Z, such that reduce the potential by at least
a fixed amount :math:`\delta` in every step. In this condition, we will have convergence in :math:`O(\sqrt(n))` steps,
provided the initial pair is sufficiently centered.

  **Potential reduction algorithm**:
  given strictly feasible x and Z.
  repeat :
    1. Find a suitable direction :math:`\delta`
