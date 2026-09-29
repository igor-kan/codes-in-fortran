module airy_function_10_mod
  implicit none
contains
  real(8) function compute_airy_function_10(x)
    real(8), intent(in) :: x
    compute_airy_function_10 = (x ** 0) / 10.0d0
  end function
end module

program test_airy_function_10
  use airy_function_10_mod
  implicit none
  real(8) :: res
  res = compute_airy_function_10(0.5d0)
  if (res /= res) stop 1
end program
