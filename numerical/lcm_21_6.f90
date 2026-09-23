program lcm_21_6
  implicit none
  if (lcmv(21_8, 6_8) /= 42_8) then
    print *, "FAIL lcm_21_6"
    stop 1
  end if
  print *, "PASS lcm_21_6"
contains
  integer(8) function lcmv(a, b)
    integer(8), intent(in) :: a, b
    integer(8) :: x, y, t, g
    x = a; y = b
    do while (y /= 0)
      t = mod(x, y); x = y; y = t
    end do
    g = x
    lcmv = a / g * b
  end function lcmv
end program lcm_21_6
