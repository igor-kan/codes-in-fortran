module legendre_poly_91_mod
  implicit none
contains
  real(8) function evaluate_legendre_poly_91(x)
    real(8), intent(in) :: x
    real(8) :: p0, p1, p_next
    integer :: k
    if (91 == 0) then
      evaluate_legendre_poly_91 = 1.0d0
      return
    end if
    if (91 == 1) then
      evaluate_legendre_poly_91 = x
      return
    end if
    p0 = 1.0d0
    p1 = x
    do k = 2, 91
      p_next = ((2.0d0 * dble(k) - 1.0d0) * x * p1 - (dble(k) - 1.0d0) * p0) / dble(k)
      p0 = p1
      p1 = p_next
    end do
    evaluate_legendre_poly_91 = p1
  end function
end module

program test_legendre_poly_91
  use legendre_poly_91_mod
  implicit none
  real(8) :: res
  res = evaluate_legendre_poly_91(0.5d0)
  if (res /= res) stop 1
end program
