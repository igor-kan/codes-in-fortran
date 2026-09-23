program factorial_20
  implicit none
  if (fact(20) /= 2432902008176640000_8) then
    print *, "FAIL factorial_20"
    stop 1
  end if
  print *, "PASS factorial_20"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_20
