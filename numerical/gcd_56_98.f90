program gcd_56_98
  implicit none
  if (gcdv(56_8, 98_8) /= 14_8) then
    print *, "FAIL gcd_56_98"
    stop 1
  end if
  print *, "PASS gcd_56_98"
contains
  integer(8) function gcdv(a, b)
    integer(8), intent(in) :: a, b
    integer(8) :: x, y, t
    x = a; y = b
    do while (y /= 0)
      t = mod(x, y); x = y; y = t
    end do
    gcdv = x
  end function gcdv
end program gcd_56_98
