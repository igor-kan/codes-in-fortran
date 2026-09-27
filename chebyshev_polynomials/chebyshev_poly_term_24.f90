module chebyshev_poly_term_24_mod
  implicit none
contains
  real(8) function compute_chebyshev_poly_term_24(x)
    real(8), intent(in) :: x
    compute_chebyshev_poly_term_24 = (x ** 24) / 24.0d0
  end function
end module

program test_chebyshev_poly_term_24
  use chebyshev_poly_term_24_mod
  implicit none
  real(8) :: res
  res = compute_chebyshev_poly_term_24(1.0d0)
  if (abs(res - (1.0d0 / 24.0d0)) > 1d-7) stop 1
end program
