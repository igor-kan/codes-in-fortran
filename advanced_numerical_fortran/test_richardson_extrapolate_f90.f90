program test_richardson_extrapolate_f90
    use richardson_extrapolate_f90_mod, only: richardson_extrap
    implicit none
    if (abs(richardson_extrap(4.0, 1.0, 1) - 7.0) > 1.0e-7) stop 1
    write(*,*) "test_richardson_extrapolate_f90 passed."
end program test_richardson_extrapolate_f90
