module chebyshev_poly_term_74_mod
  implicit none
contains
  real(8) function compute_chebyshev_poly_term_74(x)
    real(8), intent(in) :: x
    compute_chebyshev_poly_term_74 = (x ** 74) / 74.0d0
  end function
end module

program test_chebyshev_poly_term_74
  use chebyshev_poly_term_74_mod
  implicit none
  real(8) :: res
  res = compute_chebyshev_poly_term_74(1.0d0)
  if (abs(res - (1.0d0 / 74.0d0)) > 1d-7) stop 1
end program
