program cube_11
  implicit none
  if (cube(11) /= 1331_8) then
    print *, "FAIL cube_11"
    stop 1
  end if
  print *, "PASS cube_11"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_11
