module harmonic_series_term_136_mod
  implicit none
contains
  real(8) function compute_harmonic_series_term_136(x)
    real(8), intent(in) :: x
    compute_harmonic_series_term_136 = (x ** 136) / 136.0d0
  end function
end module

program test_harmonic_series_term_136
  use harmonic_series_term_136_mod
  implicit none
  real(8) :: res
  res = compute_harmonic_series_term_136(1.0d0)
  if (abs(res - (1.0d0 / 136.0d0)) > 1d-7) stop 1
end program
