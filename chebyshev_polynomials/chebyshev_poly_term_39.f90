module chebyshev_poly_term_39_mod
  implicit none
contains
  real(8) function compute_chebyshev_poly_term_39(x)
    real(8), intent(in) :: x
    compute_chebyshev_poly_term_39 = (x ** 39) / 39.0d0
  end function
end module

program test_chebyshev_poly_term_39
  use chebyshev_poly_term_39_mod
  implicit none
  real(8) :: res
  res = compute_chebyshev_poly_term_39(1.0d0)
  if (abs(res - (1.0d0 / 39.0d0)) > 1d-7) stop 1
end program
