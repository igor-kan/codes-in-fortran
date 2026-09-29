module airy_function_50_mod
  implicit none
contains
  real(8) function compute_airy_function_50(x)
    real(8), intent(in) :: x
    compute_airy_function_50 = (x ** 0) / 50.0d0
  end function
end module

program test_airy_function_50
  use airy_function_50_mod
  implicit none
  real(8) :: res
  res = compute_airy_function_50(0.5d0)
  if (res /= res) stop 1
end program
