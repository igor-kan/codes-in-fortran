module harmonic_series_term_46_mod
  implicit none
contains
  real(8) function compute_harmonic_series_term_46(x)
    real(8), intent(in) :: x
    compute_harmonic_series_term_46 = (x ** 46) / 46.0d0
  end function
end module

program test_harmonic_series_term_46
  use harmonic_series_term_46_mod
  implicit none
  real(8) :: res
  res = compute_harmonic_series_term_46(1.0d0)
  if (abs(res - (1.0d0 / 46.0d0)) > 1d-7) stop 1
end program
