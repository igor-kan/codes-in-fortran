program cube_7
  implicit none
  if (cube(7) /= 343_8) then
    print *, "FAIL cube_7"
    stop 1
  end if
  print *, "PASS cube_7"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_7
