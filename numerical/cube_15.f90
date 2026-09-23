program cube_15
  implicit none
  if (cube(15) /= 3375_8) then
    print *, "FAIL cube_15"
    stop 1
  end if
  print *, "PASS cube_15"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_15
