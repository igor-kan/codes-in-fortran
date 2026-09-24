program test_gauss_lobatto_weights_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use gauss_lobatto_weights_f90_mod, only: lobatto_endpoint_weight
    implicit none
    if (abs(lobatto_endpoint_weight(3) - 1.0_real64/3.0_real64) > 1.0e-7) stop 1
    write(*,*) "test_gauss_lobatto_weights_f90 passed."
end program test_gauss_lobatto_weights_f90
