program cube_20
  implicit none
  if (cube(20) /= 8000_8) then
    print *, "FAIL cube_20"
    stop 1
  end if
  print *, "PASS cube_20"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_20
