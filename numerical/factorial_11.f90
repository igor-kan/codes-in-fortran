program factorial_11
  implicit none
  if (fact(11) /= 39916800_8) then
    print *, "FAIL factorial_11"
    stop 1
  end if
  print *, "PASS factorial_11"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_11
