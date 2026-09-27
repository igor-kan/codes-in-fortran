module fourier_comp_term_53_mod
  implicit none
contains
  real(8) function compute_fourier_comp_term_53(x)
    real(8), intent(in) :: x
    compute_fourier_comp_term_53 = (x ** 53) / 53.0d0
  end function
end module

program test_fourier_comp_term_53
  use fourier_comp_term_53_mod
  implicit none
  real(8) :: res
  res = compute_fourier_comp_term_53(1.0d0)
  if (abs(res - (1.0d0 / 53.0d0)) > 1d-7) stop 1
end program
