program digit_sum_55555
  implicit none
  if (dsum(55555_8) /= 25_8) then
    print *, "FAIL digit_sum_55555"
    stop 1
  end if
  print *, "PASS digit_sum_55555"
contains
  integer(8) function dsum(n)
    integer(8), intent(in) :: n
    integer(8) :: m
    dsum = 0_8; m = n
    do while (m > 0)
      dsum = dsum + mod(m, 10_8); m = m / 10_8
    end do
  end function dsum
end program digit_sum_55555
