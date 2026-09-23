program cube_12
  implicit none
  if (cube(12) /= 1728_8) then
    print *, "FAIL cube_12"
    stop 1
  end if
  print *, "PASS cube_12"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_12
