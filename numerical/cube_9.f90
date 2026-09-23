program cube_9
  implicit none
  if (cube(9) /= 729_8) then
    print *, "FAIL cube_9"
    stop 1
  end if
  print *, "PASS cube_9"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_9
