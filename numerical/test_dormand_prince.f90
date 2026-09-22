program test_dormand_prince
  use dormand_prince_mod
  implicit none
  real(8) :: y, ynew, t, h, exact
  integer :: i
  y = 1.0d0; t = 0.0d0; h = 1.0d-3
  do i = 1, 2000
    call dormand_prince_step(t, y, h, ynew)
    t = t + h; y = ynew
  end do
  exact = 1.2d0 * exp(-4.0d0) + 0.4d0 * sin(2.0d0) - 0.2d0 * cos(2.0d0)
  if (abs(y - exact) > 1.0d-6) then
    print *, "FAIL", y
    stop 1
  end if
  print *, "PASS dormand_prince", y
end program test_dormand_prince
