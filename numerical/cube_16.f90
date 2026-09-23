program cube_16
  implicit none
  if (cube(16) /= 4096_8) then
    print *, "FAIL cube_16"
    stop 1
  end if
  print *, "PASS cube_16"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_16
