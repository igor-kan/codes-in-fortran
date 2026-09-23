program cube_13
  implicit none
  if (cube(13) /= 2197_8) then
    print *, "FAIL cube_13"
    stop 1
  end if
  print *, "PASS cube_13"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_13
