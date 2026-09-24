program test_rosenbrock_w_matrix_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use rosenbrock_w_matrix_f90_mod, only: rosenbrock_w
    implicit none
    if (abs(rosenbrock_w(0.5_real64, 0.2_real64, 2.0_real64) - (0.8_real64)) > 1.0e-7) stop 1
    write(*,*) "test_rosenbrock_w_matrix_f90 passed."
end program test_rosenbrock_w_matrix_f90
