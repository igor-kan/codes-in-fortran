program square_14
  implicit none
  if (sq(14) /= 196_8) then
    print *, "FAIL square_14"
    stop 1
  end if
  print *, "PASS square_14"
contains
  integer(8) function sq(n)
    integer, intent(in) :: n
    sq = int(n, 8) * int(n, 8)
  end function sq
end program square_14
