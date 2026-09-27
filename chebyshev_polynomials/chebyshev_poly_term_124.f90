module chebyshev_poly_term_124_mod
  implicit none
contains
  real(8) function compute_chebyshev_poly_term_124(x)
    real(8), intent(in) :: x
    compute_chebyshev_poly_term_124 = (x ** 124) / 124.0d0
  end function
end module

program test_chebyshev_poly_term_124
  use chebyshev_poly_term_124_mod
  implicit none
  real(8) :: res
  res = compute_chebyshev_poly_term_124(1.0d0)
  if (abs(res - (1.0d0 / 124.0d0)) > 1d-7) stop 1
end program
