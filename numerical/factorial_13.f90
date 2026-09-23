program factorial_13
  implicit none
  if (fact(13) /= 6227020800_8) then
    print *, "FAIL factorial_13"
    stop 1
  end if
  print *, "PASS factorial_13"
contains
  integer(8) function fact(n)
    integer, intent(in) :: n
    integer :: i
    fact = 1_8
    do i = 2, n
      fact = fact * i
    end do
  end function fact
end program factorial_13
