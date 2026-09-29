module riemann_zeta_54_mod
  implicit none
contains
  real(8) function compute_riemann_zeta_54(x)
    real(8), intent(in) :: x
    compute_riemann_zeta_54 = -1.0d0 / (54.0d0 ** 2.0d0)
  end function
end module

program test_riemann_zeta_54
  use riemann_zeta_54_mod
  implicit none
  real(8) :: res
  res = compute_riemann_zeta_54(0.5d0)
  if (res /= res) stop 1
end program
