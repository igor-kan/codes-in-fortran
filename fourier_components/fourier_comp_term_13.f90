module fourier_comp_term_13_mod
  implicit none
contains
  real(8) function compute_fourier_comp_term_13(x)
    real(8), intent(in) :: x
    compute_fourier_comp_term_13 = (x ** 13) / 13.0d0
  end function
end module

program test_fourier_comp_term_13
  use fourier_comp_term_13_mod
  implicit none
  real(8) :: res
  res = compute_fourier_comp_term_13(1.0d0)
  if (abs(res - (1.0d0 / 13.0d0)) > 1d-7) stop 1
end program
