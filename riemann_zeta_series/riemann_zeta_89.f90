module riemann_zeta_89_mod
  implicit none
contains
  real(8) function compute_riemann_zeta_89(x)
    real(8), intent(in) :: x
    compute_riemann_zeta_89 = 1.0d0 / (89.0d0 ** 2.0d0)
  end function
end module

program test_riemann_zeta_89
  use riemann_zeta_89_mod
  implicit none
  real(8) :: res
  res = compute_riemann_zeta_89(0.5d0)
  if (res /= res) stop 1
end program
