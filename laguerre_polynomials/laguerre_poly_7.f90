module laguerre_poly_7_mod
  implicit none
contains
  real(8) function evaluate_laguerre_poly_7(x)
    real(8), intent(in) :: x
    real(8) :: p0, p1, p_next
    integer :: k
    if (7 == 0) then
      evaluate_laguerre_poly_7 = 1.0d0
      return
    end if
    if (7 == 1) then
      evaluate_laguerre_poly_7 = 1.0d0 - x
      return
    end if
    p0 = 1.0d0
    p1 = 1.0d0 - x
    do k = 1, 7 - 1
      p_next = ((2.0d0 * dble(k) + 1.0d0 - x) * p1 - dble(k) * p0) / dble(k + 1)
      p0 = p1
      p1 = p_next
    end do
    evaluate_laguerre_poly_7 = p1
  end function
end module

program test_laguerre_poly_7
  use laguerre_poly_7_mod
  implicit none
  real(8) :: res
  res = evaluate_laguerre_poly_7(0.5d0)
  if (res /= res) stop 1
end program
