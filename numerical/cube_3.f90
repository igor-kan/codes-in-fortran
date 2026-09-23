program cube_3
  implicit none
  if (cube(3) /= 27_8) then
    print *, "FAIL cube_3"
    stop 1
  end if
  print *, "PASS cube_3"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_3
