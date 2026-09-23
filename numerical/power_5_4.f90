program power_5_4
  implicit none
  if (powv(5, 4) /= 625_8) then
    print *, "FAIL power_5_4"
    stop 1
  end if
  print *, "PASS power_5_4"
contains
  integer(8) function powv(a, b)
    integer, intent(in) :: a, b
    integer :: i
    powv = 1_8
    do i = 1, b
      powv = powv * a
    end do
  end function powv
end program power_5_4
