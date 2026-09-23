program lcm_4_6
  implicit none
  if (lcmv(4_8, 6_8) /= 12_8) then
    print *, "FAIL lcm_4_6"
    stop 1
  end if
  print *, "PASS lcm_4_6"
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
end program lcm_4_6
