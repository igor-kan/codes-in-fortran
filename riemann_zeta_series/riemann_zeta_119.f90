module riemann_zeta_119_mod
  implicit none
contains
  real(8) function compute_riemann_zeta_119(x)
    real(8), intent(in) :: x
    compute_riemann_zeta_119 = 1.0d0 / (119.0d0 ** 2.0d0)
  end function
end module

program test_riemann_zeta_119
  use riemann_zeta_119_mod
  implicit none
  real(8) :: res
  res = compute_riemann_zeta_119(0.5d0)
  if (res /= res) stop 1
end program
