program factorial_17
  implicit none
  if (fact(17) /= 355687428096000_8) then
    print *, "FAIL factorial_17"
    stop 1
  end if
  print *, "PASS factorial_17"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_17
