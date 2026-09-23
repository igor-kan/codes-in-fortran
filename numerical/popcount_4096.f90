program popcount_4096
  implicit none
  if (popcount(4096_8) /= 1_8) then
    print *, "FAIL popcount_4096"
    stop 1
  end if
  print *, "PASS popcount_4096"
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
end program popcount_4096
