program cube_1
  implicit none
  if (cube(1) /= 1_8) then
    print *, "FAIL cube_1"
    stop 1
  end if
  print *, "PASS cube_1"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_1
