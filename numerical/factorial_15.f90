program factorial_15
  implicit none
  if (fact(15) /= 1307674368000_8) then
    print *, "FAIL factorial_15"
    stop 1
  end if
  print *, "PASS factorial_15"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_15
