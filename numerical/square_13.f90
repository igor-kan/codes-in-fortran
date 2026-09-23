program square_13
  implicit none
  if (sq(13) /= 169_8) then
    print *, "FAIL square_13"
    stop 1
  end if
  print *, "PASS square_13"
contains
  integer(8) function sq(n)
    integer, intent(in) :: n
    sq = int(n, 8) * int(n, 8)
  end function sq
end program square_13
