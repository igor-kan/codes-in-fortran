module power_series_term_10_mod
  implicit none
contains
  real(8) function compute_power_series_term_10(x)
    real(8), intent(in) :: x
    compute_power_series_term_10 = (x ** 10) / 10.0d0
  end function
end module

program test_power_series_term_10
  use power_series_term_10_mod
  implicit none
  real(8) :: res
  res = compute_power_series_term_10(1.0d0)
  if (abs(res - (1.0d0 / 10.0d0)) > 1d-7) stop 1
end program
