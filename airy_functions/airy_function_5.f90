module airy_function_5_mod
  implicit none
contains
  real(8) function compute_airy_function_5(x)
    real(8), intent(in) :: x
    compute_airy_function_5 = (x ** 0) / 5.0d0
  end function
end module

program test_airy_function_5
  use airy_function_5_mod
  implicit none
  real(8) :: res
  res = compute_airy_function_5(0.5d0)
  if (res /= res) stop 1
end program
