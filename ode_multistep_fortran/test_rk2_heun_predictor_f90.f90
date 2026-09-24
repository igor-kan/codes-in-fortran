program test_rk2_heun_predictor_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use rk2_heun_predictor_f90_mod, only: heun_pred
    implicit none
    if (abs(heun_pred(2.0_real64, 1.0_real64, 0.5_real64) - (2.5_real64)) > 1.0e-7) stop 1
    write(*,*) "test_rk2_heun_predictor_f90 passed."
end program test_rk2_heun_predictor_f90
