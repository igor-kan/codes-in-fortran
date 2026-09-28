module chebyshev_u_43_mod
  implicit none
contains
  real(8) function evaluate_chebyshev_u_43(x)
    real(8), intent(in) :: x
    real(8) :: p0, p1, p_next
    integer :: k
    if (43 == 0) then
      evaluate_chebyshev_u_43 = 1.0d0
      return
    end if
    if (43 == 1) then
      evaluate_chebyshev_u_43 = 2.0d0 * x
      return
    end if
    p0 = 1.0d0
    p1 = 2.0d0 * x
    do k = 1, 43 - 1
      p_next = 2.0d0 * x * p1 - p0
      p0 = p1
      p1 = p_next
    end do
    evaluate_chebyshev_u_43 = p1
  end function
end module

program test_chebyshev_u_43
  use chebyshev_u_43_mod
  implicit none
  real(8) :: res
  res = evaluate_chebyshev_u_43(0.5d0)
  if (res /= res) stop 1
end program
