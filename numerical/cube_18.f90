program cube_18
  implicit none
  if (cube(18) /= 5832_8) then
    print *, "FAIL cube_18"
    stop 1
  end if
  print *, "PASS cube_18"
contains
  integer(8) function cube(n)
    integer, intent(in) :: n
    cube = int(n, 8) * int(n, 8) * int(n, 8)
  end function cube
end program cube_18
