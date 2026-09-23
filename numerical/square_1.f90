program square_1
  implicit none
  if (sq(1) /= 1_8) then
    print *, "FAIL square_1"
    stop 1
  end if
  print *, "PASS square_1"
contains
  integer(8) function sq(n)
    integer, intent(in) :: n
    sq = int(n, 8) * int(n, 8)
  end function sq
end program square_1
