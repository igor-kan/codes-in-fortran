program test_advection_1d_upwind_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use advection_1d_upwind_f90_mod, only: upwind_flux
    implicit none
    if (abs(upwind_flux(2.0_real64, 1.0_real64, 0.5_real64) - (1.5_real64)) > 1.0e-7) stop 1
    write(*,*) "test_advection_1d_upwind_f90 passed."
end program test_advection_1d_upwind_f90
