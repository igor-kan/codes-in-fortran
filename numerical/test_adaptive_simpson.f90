program test_adaptive_simpson
  use adaptive_simpson_mod
  implicit none
  real(8) :: v, exact
  v = adaptive_simpson(func_sin, 0.0d0, 3.141592653589793d0, 1.0d-10)
  exact = 2.0d0
  if (abs(v - exact) > 1.0d-8) then
    print *, "FAIL", v
    stop 1
  end if
  print *, "PASS adaptive_simpson", v
end program test_adaptive_simpson
