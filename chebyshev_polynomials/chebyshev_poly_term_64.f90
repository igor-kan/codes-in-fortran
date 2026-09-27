module chebyshev_poly_term_64_mod
  implicit none
contains
  real(8) function compute_chebyshev_poly_term_64(x)
    real(8), intent(in) :: x
    compute_chebyshev_poly_term_64 = (x ** 64) / 64.0d0
  end function
end module

program test_chebyshev_poly_term_64
  use chebyshev_poly_term_64_mod
  implicit none
  real(8) :: res
  res = compute_chebyshev_poly_term_64(1.0d0)
  if (abs(res - (1.0d0 / 64.0d0)) > 1d-7) stop 1
end program
