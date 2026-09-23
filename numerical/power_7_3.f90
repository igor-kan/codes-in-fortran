program power_7_3
  implicit none
  if (powv(7, 3) /= 343_8) then
    print *, "FAIL power_7_3"
    stop 1
  end if
  print *, "PASS power_7_3"
contains
  integer(8) function powv(a, b)
    integer, intent(in) :: a, b
    integer :: i
    powv = 1_8
    do i = 1, b
      powv = powv * a
    end do
  end function powv
end program power_7_3
