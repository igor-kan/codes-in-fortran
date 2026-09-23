program power_3_5
  implicit none
  if (powv(3, 5) /= 243_8) then
    print *, "FAIL power_3_5"
    stop 1
  end if
  print *, "PASS power_3_5"
contains
  integer(8) function powv(a, b)
    integer, intent(in) :: a, b
    integer :: i
    powv = 1_8
    do i = 1, b
      powv = powv * a
    end do
  end function powv
end program power_3_5
