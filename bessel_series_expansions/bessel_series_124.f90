module bessel_series_124_mod
  implicit none
contains
  real(8) function evaluate_bessel_series_124(x)
    real(8), intent(in) :: x
    real(8) :: p0, p1, p_next
    integer :: k
    real(8) :: sign, denom
    sign = 1.0d0
    denom = 5.838964819623936e+19d0
    evaluate_bessel_series_124 = sign * ((x / 2.0d0) ** 24) / denom
  end function
end module

program test_bessel_series_124
  use bessel_series_124_mod
  implicit none
  real(8) :: res
  res = evaluate_bessel_series_124(0.5d0)
  if (res /= res) stop 1
end program
