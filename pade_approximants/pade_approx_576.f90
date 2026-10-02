module pade_approx_576_mod
  implicit none
contains
  real(8) function compute_pade_approx_576(x)
    real(8), intent(in) :: x
    compute_pade_approx_576 = (1.0d0 + x * 1.0d0) / (1.0d0 + x * x * 1.0d0)
  end function
end module

program test_pade_approx_576
  use pade_approx_576_mod
  implicit none
  real(8) :: res
  res = compute_pade_approx_576(0.5d0)
  if (res /= res) stop 1
end program
