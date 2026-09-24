program test_heat_1d_crank_nicolson_r_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use heat_1d_crank_nicolson_r_f90_mod, only: cn_diffusion_r
    implicit none
    if (abs(cn_diffusion_r(1.0_real64, 0.02_real64, 0.1_real64) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_heat_1d_crank_nicolson_r_f90 passed."
end program test_heat_1d_crank_nicolson_r_f90
