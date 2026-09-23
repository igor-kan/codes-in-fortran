program factorial_4
  implicit none
  if (fact(4) /= 24_8) then
    print *, "FAIL factorial_4"
    stop 1
  end if
  print *, "PASS factorial_4"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_4
