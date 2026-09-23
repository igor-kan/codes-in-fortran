program factorial_6
  implicit none
  if (fact(6) /= 720_8) then
    print *, "FAIL factorial_6"
    stop 1
  end if
  print *, "PASS factorial_6"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_6
