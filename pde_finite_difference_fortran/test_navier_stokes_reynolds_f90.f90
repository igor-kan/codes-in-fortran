program test_navier_stokes_reynolds_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use navier_stokes_reynolds_f90_mod, only: reynolds_num
    implicit none
    if (abs(reynolds_num(10.0_real64, 2.0_real64, 0.01_real64) - (2000.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_navier_stokes_reynolds_f90 passed."
end program test_navier_stokes_reynolds_f90
