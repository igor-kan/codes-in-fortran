module geometric_series_term_112_mod
  implicit none
contains
  real(8) function compute_geometric_series_term_112(x)
    real(8), intent(in) :: x
    compute_geometric_series_term_112 = (x ** 112) / 112.0d0
  end function
end module

program test_geometric_series_term_112
  use geometric_series_term_112_mod
  implicit none
  real(8) :: res
  res = compute_geometric_series_term_112(1.0d0)
  if (abs(res - (1.0d0 / 112.0d0)) > 1d-7) stop 1
end program
