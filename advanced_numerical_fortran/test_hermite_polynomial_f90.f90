program test_hermite_polynomial_f90
    use hermite_polynomial_f90_mod, only: hermite_recurrence
    implicit none
    if (hermite_recurrence(2.0, 1.0, 1.0, 0) /= 4.0) stop 1
    write(*,*) "test_hermite_polynomial_f90 passed."
end program test_hermite_polynomial_f90
