program factorial_16
  implicit none
  if (fact(16) /= 20922789888000_8) then
    print *, "FAIL factorial_16"
    stop 1
  end if
  print *, "PASS factorial_16"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_16
