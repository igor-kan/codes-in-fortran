program reverse_int_42
  implicit none
  if (revint(42_8) /= 24_8) then
    print *, "FAIL reverse_int_42"
    stop 1
  end if
  print *, "PASS reverse_int_42"
contains
  integer(8) function revint(n)
    integer(8), intent(in) :: n
    integer(8) :: m, r
    m = n; r = 0_8
    do while (m > 0)
      r = r * 10_8 + mod(m, 10_8); m = m / 10_8
    end do
    revint = r
  end function revint
end program reverse_int_42
