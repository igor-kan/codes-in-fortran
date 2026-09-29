module airy_function_35_mod
  implicit none
contains
  real(8) function compute_airy_function_35(x)
    real(8), intent(in) :: x
    compute_airy_function_35 = (x ** 0) / 35.0d0
  end function
end module

program test_airy_function_35
  use airy_function_35_mod
  implicit none
  real(8) :: res
  res = compute_airy_function_35(0.5d0)
  if (res /= res) stop 1
end program
