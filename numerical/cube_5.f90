program cube_5
  implicit none
  if (cube(5) /= 125_8) then
    print *, "FAIL cube_5"
    stop 1
  end if
  print *, "PASS cube_5"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_5
