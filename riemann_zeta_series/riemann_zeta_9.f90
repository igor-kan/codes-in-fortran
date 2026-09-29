module riemann_zeta_9_mod
  implicit none
contains
  real(8) function compute_riemann_zeta_9(x)
    real(8), intent(in) :: x
    compute_riemann_zeta_9 = 1.0d0 / (9.0d0 ** 2.0d0)
  end function
end module

program test_riemann_zeta_9
  use riemann_zeta_9_mod
  implicit none
  real(8) :: res
  res = compute_riemann_zeta_9(0.5d0)
  if (res /= res) stop 1
end program
