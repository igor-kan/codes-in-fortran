module harmonic_series_term_21_mod
  implicit none
contains
  real(8) function compute_harmonic_series_term_21(x)
    real(8), intent(in) :: x
    compute_harmonic_series_term_21 = (x ** 21) / 21.0d0
  end function
end module

program test_harmonic_series_term_21
  use harmonic_series_term_21_mod
  implicit none
  real(8) :: res
  res = compute_harmonic_series_term_21(1.0d0)
  if (abs(res - (1.0d0 / 21.0d0)) > 1d-7) stop 1
end program
