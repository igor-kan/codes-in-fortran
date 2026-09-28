module hermite_poly_30_mod
  implicit none
contains
  real(8) function evaluate_hermite_poly_30(x)
    real(8), intent(in) :: x
    real(8) :: p0, p1, p_next
    integer :: k
    if (30 == 0) then
      evaluate_hermite_poly_30 = 1.0d0
      return
    end if
    if (30 == 1) then
      evaluate_hermite_poly_30 = 2.0d0 * x
      return
    end if
    p0 = 1.0d0
    p1 = 2.0d0 * x
    do k = 1, 30 - 1
      p_next = 2.0d0 * x * p1 - 2.0d0 * dble(k) * p0
      p0 = p1
      p1 = p_next
    end do
    evaluate_hermite_poly_30 = p1
  end function
end module

program test_hermite_poly_30
  use hermite_poly_30_mod
  implicit none
  real(8) :: res
  res = evaluate_hermite_poly_30(0.5d0)
  if (res /= res) stop 1
end program
