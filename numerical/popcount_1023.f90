program popcount_1023
  implicit none
  if (popcount(1023_8) /= 10_8) then
    print *, "FAIL popcount_1023"
    stop 1
  end if
  print *, "PASS popcount_1023"
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
end program popcount_1023
