module airy_function_75_mod
  implicit none
contains
  real(8) function compute_airy_function_75(x)
    real(8), intent(in) :: x
    compute_airy_function_75 = (x ** 0) / 75.0d0
  end function
end module

program test_airy_function_75
  use airy_function_75_mod
  implicit none
  real(8) :: res
  res = compute_airy_function_75(0.5d0)
  if (res /= res) stop 1
end program
