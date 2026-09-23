program lcm_35_10
  implicit none
  if (lcmv(35_8, 10_8) /= 70_8) then
    print *, "FAIL lcm_35_10"
    stop 1
  end if
  print *, "PASS lcm_35_10"
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
end program lcm_35_10
