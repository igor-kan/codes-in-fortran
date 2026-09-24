program test_burgers_viscous_diffusion_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use burgers_viscous_diffusion_f90_mod, only: burgers_diff
    implicit none
    if (abs(burgers_diff(0.01_real64, 100.0_real64) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_burgers_viscous_diffusion_f90 passed."
end program test_burgers_viscous_diffusion_f90
