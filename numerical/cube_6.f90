program cube_6
  implicit none
  if (cube(6) /= 216_8) then
    print *, "FAIL cube_6"
    stop 1
  end if
  print *, "PASS cube_6"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_6
