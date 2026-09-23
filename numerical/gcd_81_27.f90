program gcd_81_27
  implicit none
  if (gcdv(81_8, 27_8) /= 27_8) then
    print *, "FAIL gcd_81_27"
    stop 1
  end if
  print *, "PASS gcd_81_27"
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
end program gcd_81_27
