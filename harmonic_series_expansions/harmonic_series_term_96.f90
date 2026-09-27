module harmonic_series_term_96_mod
  implicit none
contains
  real(8) function compute_harmonic_series_term_96(x)
    real(8), intent(in) :: x
    compute_harmonic_series_term_96 = (x ** 96) / 96.0d0
  end function
end module

program test_harmonic_series_term_96
  use harmonic_series_term_96_mod
  implicit none
  real(8) :: res
  res = compute_harmonic_series_term_96(1.0d0)
  if (abs(res - (1.0d0 / 96.0d0)) > 1d-7) stop 1
end program
