module exp_integral_96_mod
  implicit none
contains
  real(8) function compute_exp_integral_96(x)
    real(8), intent(in) :: x
    compute_exp_integral_96 = exp(-x) / 96.0d0
  end function
end module

program test_exp_integral_96
  use exp_integral_96_mod
  implicit none
  real(8) :: res
  res = compute_exp_integral_96(0.5d0)
  if (res /= res) stop 1
end program
