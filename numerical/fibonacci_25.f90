program fibonacci_25
  implicit none
  if (fib(25) /= 75025_8) then
    print *, "FAIL fibonacci_25"
    stop 1
  end if
  print *, "PASS fibonacci_25"
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
end program fibonacci_25
