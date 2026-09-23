program square_12
  implicit none
  if (sq(12) /= 144_8) then
    print *, "FAIL square_12"
    stop 1
  end if
  print *, "PASS square_12"
contains
  integer(8) function sq(n)
    integer, intent(in) :: n
    sq = int(n, 8) * int(n, 8)
  end function sq
end program square_12
