program test_laguerre_radial_f90
    use laguerre_radial_f90_mod, only: laguerre_recurrence
    implicit none
    if (laguerre_recurrence(1.0, 1.0, 0.0, 0) /= 1.0) stop 1
    write(*,*) "test_laguerre_radial_f90 passed."
end program test_laguerre_radial_f90
