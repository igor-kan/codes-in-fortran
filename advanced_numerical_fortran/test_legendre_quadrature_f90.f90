program test_legendre_quadrature_f90
    use legendre_quadrature_f90_mod, only: legendre_recurrence
    implicit none
    if (legendre_recurrence(1.0, 1.0, 1.0, 1) /= 1.0) stop 1
    write(*,*) "test_legendre_quadrature_f90 passed."
end program test_legendre_quadrature_f90
