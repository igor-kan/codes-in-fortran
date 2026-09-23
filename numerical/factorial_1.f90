program factorial_1
  implicit none
  if (fact(1) /= 1_8) then
    print *, "FAIL factorial_1"
    stop 1
  end if
  print *, "PASS factorial_1"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_1
