program fibonacci_38
  implicit none
  if (fib(38) /= 39088169_8) then
    print *, "FAIL fibonacci_38"
    stop 1
  end if
  print *, "PASS fibonacci_38"
contains
  integer(8) function fib(n)
    integer, intent(in) :: n
    integer(8) :: a, b, t
    integer :: i
    a = 0_8; b = 1_8
    do i = 1, n
      t = a + b; a = b; b = t
    end do
    fib = a
  end function fib
end program fibonacci_38
