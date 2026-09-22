program test_secant_method
  use secant_method_mod
  implicit none
  real(8) :: root
  root = secant(cubic, 1.0d0, 2.0d0, 1.0d-12, 100)
  if (abs(root ** 3 - 2.0d0 * root - 5.0d0) > 1.0d-9) then
    print *, "FAIL", root
    stop 1
  end if
  print *, "PASS secant_method", root
end program test_secant_method
