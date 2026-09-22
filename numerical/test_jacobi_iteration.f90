program test_jacobi_iteration
  use jacobi_iteration_mod
  implicit none
  real(8) :: a(2, 2), b(2), x(2)
  integer :: iters
  a = reshape([4.0d0, 1.0d0, 1.0d0, 3.0d0], [2, 2])
  b = [1.0d0, 2.0d0]
  x = [0.0d0, 0.0d0]
  call jacobi_solve(a, b, x, 2, 1.0d-12, 1000, iters)
  if (abs(4.0d0 * x(1) + x(2) - 1.0d0) > 1.0d-8) then
    print *, "FAIL", x
    stop 1
  end if
  print *, "PASS jacobi_iteration", x
end program test_jacobi_iteration
