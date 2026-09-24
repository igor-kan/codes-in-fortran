program test_adaptive_simpson_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use adaptive_simpson_f90_mod, only: simpson_step
    implicit none
    real(real64) :: a
    a = simpson_step(1.0_real64, 1.0_real64, 1.0_real64, 2.0_real64)
    if (abs(a - 2.0_real64) > 1.0e-7) stop 1
    write(*,*) "test_adaptive_simpson_f90 passed."
end program test_adaptive_simpson_f90
