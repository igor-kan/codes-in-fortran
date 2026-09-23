program cube_10
  implicit none
  if (cube(10) /= 1000_8) then
    print *, "FAIL cube_10"
    stop 1
  end if
  print *, "PASS cube_10"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_10
