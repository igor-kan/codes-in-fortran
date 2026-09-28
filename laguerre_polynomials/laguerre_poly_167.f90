module laguerre_poly_167_mod
  implicit none
contains
  real(8) function evaluate_laguerre_poly_167(x)
    real(8), intent(in) :: x
    real(8) :: p0, p1, p_next
    integer :: k
    if (167 == 0) then
      evaluate_laguerre_poly_167 = 1.0d0
      return
    end if
    if (167 == 1) then
      evaluate_laguerre_poly_167 = 1.0d0 - x
      return
    end if
    p0 = 1.0d0
    p1 = 1.0d0 - x
    do k = 1, 167 - 1
      p_next = ((2.0d0 * dble(k) + 1.0d0 - x) * p1 - dble(k) * p0) / dble(k + 1)
      p0 = p1
      p1 = p_next
    end do
    evaluate_laguerre_poly_167 = p1
  end function
end module

program test_laguerre_poly_167
  use laguerre_poly_167_mod
  implicit none
  real(8) :: res
  res = evaluate_laguerre_poly_167(0.5d0)
  if (res /= res) stop 1
end program
