module exp_integral_71_mod
  implicit none
contains
  real(8) function compute_exp_integral_71(x)
    real(8), intent(in) :: x
    compute_exp_integral_71 = exp(-x) / 71.0d0
  end function
end module

program test_exp_integral_71
  use exp_integral_71_mod
  implicit none
  real(8) :: res
  res = compute_exp_integral_71(0.5d0)
  if (res /= res) stop 1
end program
