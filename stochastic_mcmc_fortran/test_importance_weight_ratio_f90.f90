program test_importance_weight_ratio_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use importance_weight_ratio_f90_mod, only: imp_weight
    implicit none
    if (abs(imp_weight(0.6_real64, 0.2_real64) - (3.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_importance_weight_ratio_f90 passed."
end program test_importance_weight_ratio_f90
