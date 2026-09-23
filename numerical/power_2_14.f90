program power_2_14
  implicit none
  if (powv(2, 14) /= 16384_8) then
    print *, "FAIL power_2_14"
    stop 1
  end if
  print *, "PASS power_2_14"
contains
  integer(8) function powv(a, b)
    integer, intent(in) :: a, b
    integer :: i
    powv = 1_8
    do i = 1, b
      powv = powv * a
    end do
  end function powv
end program power_2_14
