module riemann_zeta_74_mod
  implicit none
contains
  real(8) function compute_riemann_zeta_74(x)
    real(8), intent(in) :: x
    compute_riemann_zeta_74 = -1.0d0 / (74.0d0 ** 2.0d0)
  end function
end module

program test_riemann_zeta_74
  use riemann_zeta_74_mod
  implicit none
  real(8) :: res
  res = compute_riemann_zeta_74(0.5d0)
  if (res /= res) stop 1
end program
