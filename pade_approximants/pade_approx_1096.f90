module pade_approx_1096_mod
  implicit none
contains
  real(8) function compute_pade_approx_1096(x)
    real(8), intent(in) :: x
    compute_pade_approx_1096 = (1.0d0 + x * 2.0d0) / (1.0d0 + x * x * 1.0d0)
  end function
end module

program test_pade_approx_1096
  use pade_approx_1096_mod
  implicit none
  real(8) :: res
  res = compute_pade_approx_1096(0.5d0)
  if (res /= res) stop 1
end program
