module power_series_term_25_mod
  implicit none
contains
  real(8) function compute_power_series_term_25(x)
    real(8), intent(in) :: x
    compute_power_series_term_25 = (x ** 25) / 25.0d0
  end function
end module

program test_power_series_term_25
  use power_series_term_25_mod
  implicit none
  real(8) :: res
  res = compute_power_series_term_25(1.0d0)
  if (abs(res - (1.0d0 / 25.0d0)) > 1d-7) stop 1
end program
