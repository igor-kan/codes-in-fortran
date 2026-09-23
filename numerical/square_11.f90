program square_11
  implicit none
  if (sq(11) /= 121_8) then
    print *, "FAIL square_11"
    stop 1
  end if
  print *, "PASS square_11"
contains
  integer(8) function sq(n)
    integer, intent(in) :: n
    sq = int(n, 8) * int(n, 8)
  end function sq
end program square_11
