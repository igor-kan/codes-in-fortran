module harmonic_series_term_11_mod
  implicit none
contains
  real(8) function compute_harmonic_series_term_11(x)
    real(8), intent(in) :: x
    compute_harmonic_series_term_11 = (x ** 11) / 11.0d0
  end function
end module

program test_harmonic_series_term_11
  use harmonic_series_term_11_mod
  implicit none
  real(8) :: res
  res = compute_harmonic_series_term_11(1.0d0)
  if (abs(res - (1.0d0 / 11.0d0)) > 1d-7) stop 1
end program
