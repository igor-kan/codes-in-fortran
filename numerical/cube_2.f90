program cube_2
  implicit none
  if (cube(2) /= 8_8) then
    print *, "FAIL cube_2"
    stop 1
  end if
  print *, "PASS cube_2"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_2
