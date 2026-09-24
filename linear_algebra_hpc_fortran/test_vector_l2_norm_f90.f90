program test_vector_l2_norm_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use vector_l2_norm_f90_mod, only: l2_norm
    implicit none
    if (abs(l2_norm(25.0_real64) - (5.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_vector_l2_norm_f90 passed."
end program test_vector_l2_norm_f90
