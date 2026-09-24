program test_yoshida_4th_symplectic_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use yoshida_4th_symplectic_f90_mod, only: yoshida_w1
    implicit none
    if (abs(yoshida_w1(1) - (1.351207191959657_real64)) > 1.0e-7) stop 1
    write(*,*) "test_yoshida_4th_symplectic_f90 passed."
end program test_yoshida_4th_symplectic_f90
