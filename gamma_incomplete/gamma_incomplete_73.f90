module gamma_incomplete_73_mod
  implicit none
contains
  real(8) function compute_gamma_incomplete_73(x)
    real(8), intent(in) :: x
    compute_gamma_incomplete_73 = (x ** 2) / 2.0d0
  end function
end module

program test_gamma_incomplete_73
  use gamma_incomplete_73_mod
  implicit none
  real(8) :: res
  res = compute_gamma_incomplete_73(0.5d0)
  if (res /= res) stop 1
end program
