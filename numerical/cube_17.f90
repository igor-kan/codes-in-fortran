program cube_17
  implicit none
  if (cube(17) /= 4913_8) then
    print *, "FAIL cube_17"
    stop 1
  end if
  print *, "PASS cube_17"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_17
