module chebyshev_colloc_27_mod
  implicit none
contains
  real(8) function compute_chebyshev_colloc_27(x)
    real(8), intent(in) :: x
    compute_chebyshev_colloc_27 = cos(3.141592653589793d0 * 7.0d0 / 8.0d0) * x
  end function
end module

program test_chebyshev_colloc_27
  use chebyshev_colloc_27_mod
  implicit none
  real(8) :: res
  res = compute_chebyshev_colloc_27(0.5d0)
  if (res /= res) stop 1
end program
