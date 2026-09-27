module fourier_comp_term_73_mod
  implicit none
contains
  real(8) function compute_fourier_comp_term_73(x)
    real(8), intent(in) :: x
    compute_fourier_comp_term_73 = (x ** 73) / 73.0d0
  end function
end module

program test_fourier_comp_term_73
  use fourier_comp_term_73_mod
  implicit none
  real(8) :: res
  res = compute_fourier_comp_term_73(1.0d0)
  if (abs(res - (1.0d0 / 73.0d0)) > 1d-7) stop 1
end program
