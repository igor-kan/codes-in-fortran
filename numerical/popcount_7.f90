program popcount_7
  implicit none
  if (popcount(7_8) /= 3_8) then
    print *, "FAIL popcount_7"
    stop 1
  end if
  print *, "PASS popcount_7"
contains
  integer function popcount(n)
    integer(8), intent(in) :: n
    integer(8) :: m
    integer :: c
    m = n; c = 0
    do while (m > 0)
      c = c + int(mod(m, 2_8)); m = m / 2_8
    end do
    popcount = c
  end function popcount
end program popcount_7
