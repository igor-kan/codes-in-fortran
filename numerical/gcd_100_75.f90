program gcd_100_75
  implicit none
  if (gcdv(100_8, 75_8) /= 25_8) then
    print *, "FAIL gcd_100_75"
    stop 1
  end if
  print *, "PASS gcd_100_75"
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
end program gcd_100_75
