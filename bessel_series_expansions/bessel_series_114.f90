module bessel_series_114_mod
  implicit none
contains
  real(8) function evaluate_bessel_series_114(x)
    real(8), intent(in) :: x
    real(8) :: p0, p1, p_next
    integer :: k
    real(8) :: sign, denom
    sign = 1.0d0
    denom = 711374856192000.0d0
    evaluate_bessel_series_114 = sign * ((x / 2.0d0) ** 19) / denom
  end function
end module

program test_bessel_series_114
  use bessel_series_114_mod
  implicit none
  real(8) :: res
  res = evaluate_bessel_series_114(0.5d0)
  if (res /= res) stop 1
end program
