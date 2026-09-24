program test_romberg_quad_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use romberg_quad_f90_mod, only: romberg_step
    implicit none
    real(real64) :: val
    val = romberg_step(4.0_real64, 1.0_real64, 1)
    if (abs(val - 5.0_real64) > 1.0e-7) stop 1
    write(*,*) "test_romberg_quad_f90 passed."
end program test_romberg_quad_f90
