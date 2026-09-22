program test_chebyshev_interpolation
  use chebyshev_interpolation_mod
  implicit none
  real(8) :: nodes(11), values(11), approx, exact, pi
  integer :: i
  pi = 3.141592653589793d0
  call chebyshev_nodes(11, nodes)
  do i = 1, 11
    values(i) = runge(nodes(i))
  end do
  approx = chebyshev_eval(nodes, values, 11, 0.0d0)
  exact = runge(0.0d0)
  if (abs(approx - exact) > 1.0d-6) then
    print *, "FAIL", approx, exact
    stop 1
  end if
  print *, "PASS chebyshev_interpolation", approx
end program test_chebyshev_interpolation
