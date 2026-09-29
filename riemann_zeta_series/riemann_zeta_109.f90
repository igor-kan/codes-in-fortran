module riemann_zeta_109_mod
  implicit none
contains
  real(8) function compute_riemann_zeta_109(x)
    real(8), intent(in) :: x
    compute_riemann_zeta_109 = 1.0d0 / (109.0d0 ** 2.0d0)
  end function
end module

program test_riemann_zeta_109
  use riemann_zeta_109_mod
  implicit none
  real(8) :: res
  res = compute_riemann_zeta_109(0.5d0)
  if (res /= res) stop 1
end program
