program factorial_19
  implicit none
  if (fact(19) /= 121645100408832000_8) then
    print *, "FAIL factorial_19"
    stop 1
  end if
  print *, "PASS factorial_19"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_19
