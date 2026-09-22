program test_brent_minimization
  use brent_minimization_mod
  implicit none
  real(8) :: x
  x = brent_minimize(parabola, -10.0d0, 10.0d0, 1.0d-10)
  if (abs(x - 3.0d0) > 1.0d-5) then
    print *, "FAIL", x
    stop 1
  end if
  print *, "PASS brent_minimization", x
end program test_brent_minimization
