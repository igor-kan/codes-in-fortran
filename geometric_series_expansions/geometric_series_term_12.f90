module geometric_series_term_12_mod
  implicit none
contains
  real(8) function compute_geometric_series_term_12(x)
    real(8), intent(in) :: x
    compute_geometric_series_term_12 = (x ** 12) / 12.0d0
  end function
end module

program test_geometric_series_term_12
  use geometric_series_term_12_mod
  implicit none
  real(8) :: res
  res = compute_geometric_series_term_12(1.0d0)
  if (abs(res - (1.0d0 / 12.0d0)) > 1d-7) stop 1
end program
