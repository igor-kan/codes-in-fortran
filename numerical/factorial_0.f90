program factorial_0
  implicit none
  if (fact(0) /= 1_8) then
    print *, "FAIL factorial_0"
    stop 1
  end if
  print *, "PASS factorial_0"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_0
