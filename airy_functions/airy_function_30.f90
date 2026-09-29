module airy_function_30_mod
  implicit none
contains
  real(8) function compute_airy_function_30(x)
    real(8), intent(in) :: x
    compute_airy_function_30 = (x ** 0) / 30.0d0
  end function
end module

program test_airy_function_30
  use airy_function_30_mod
  implicit none
  real(8) :: res
  res = compute_airy_function_30(0.5d0)
  if (res /= res) stop 1
end program
