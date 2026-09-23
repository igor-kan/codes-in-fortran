program factorial_18
  implicit none
  if (fact(18) /= 6402373705728000_8) then
    print *, "FAIL factorial_18"
    stop 1
  end if
  print *, "PASS factorial_18"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_18
