module exp_integral_51_mod
  implicit none
contains
  real(8) function compute_exp_integral_51(x)
    real(8), intent(in) :: x
    compute_exp_integral_51 = exp(-x) / 51.0d0
  end function
end module

program test_exp_integral_51
  use exp_integral_51_mod
  implicit none
  real(8) :: res
  res = compute_exp_integral_51(0.5d0)
  if (res /= res) stop 1
end program
