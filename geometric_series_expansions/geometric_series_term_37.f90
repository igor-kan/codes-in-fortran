module geometric_series_term_37_mod
  implicit none
contains
  real(8) function compute_geometric_series_term_37(x)
    real(8), intent(in) :: x
    compute_geometric_series_term_37 = (x ** 37) / 37.0d0
  end function
end module

program test_geometric_series_term_37
  use geometric_series_term_37_mod
  implicit none
  real(8) :: res
  res = compute_geometric_series_term_37(1.0d0)
  if (abs(res - (1.0d0 / 37.0d0)) > 1d-7) stop 1
end program
