program cube_8
  implicit none
  if (cube(8) /= 512_8) then
    print *, "FAIL cube_8"
    stop 1
  end if
  print *, "PASS cube_8"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_8
