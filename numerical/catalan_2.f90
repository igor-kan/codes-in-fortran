program catalan_2
  implicit none
  if (catalan(2) /= 2_8) then
    print *, "FAIL catalan_2"
    stop 1
  end if
  print *, "PASS catalan_2"
contains
  integer(8) function catalan(n)
    integer, intent(in) :: n
    integer(8) :: c
    integer :: k
    c = 1_8
    do k = 1, n
      c = c * 2_8 * int(2 * k - 1, 8) / int(k + 1, 8)
    end do
    catalan = c
  end function catalan
end program catalan_2
