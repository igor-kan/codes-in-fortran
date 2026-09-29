module exp_integral_6_mod
  implicit none
contains
  real(8) function compute_exp_integral_6(x)
    real(8), intent(in) :: x
    compute_exp_integral_6 = exp(-x) / 6.0d0
  end function
end module

program test_exp_integral_6
  use exp_integral_6_mod
  implicit none
  real(8) :: res
  res = compute_exp_integral_6(0.5d0)
  if (res /= res) stop 1
end program
