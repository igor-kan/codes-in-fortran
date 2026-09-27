module fourier_comp_term_148_mod
  implicit none
contains
  real(8) function compute_fourier_comp_term_148(x)
    real(8), intent(in) :: x
    compute_fourier_comp_term_148 = (x ** 148) / 148.0d0
  end function
end module

program test_fourier_comp_term_148
  use fourier_comp_term_148_mod
  implicit none
  real(8) :: res
  res = compute_fourier_comp_term_148(1.0d0)
  if (abs(res - (1.0d0 / 148.0d0)) > 1d-7) stop 1
end program
