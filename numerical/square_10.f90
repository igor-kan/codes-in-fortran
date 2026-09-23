program square_10
  implicit none
  if (sq(10) /= 100_8) then
    print *, "FAIL square_10"
    stop 1
  end if
  print *, "PASS square_10"
contains
  integer(8) function sq(n)
    integer, intent(in) :: n
    sq = int(n, 8) * int(n, 8)
  end function sq
end program square_10
