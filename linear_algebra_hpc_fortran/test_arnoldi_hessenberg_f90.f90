program test_arnoldi_hessenberg_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use arnoldi_hessenberg_f90_mod, only: hessenberg_h
    implicit none
    if (abs(hessenberg_h(3.5_real64) - (3.5_real64)) > 1.0e-7) stop 1
    write(*,*) "test_arnoldi_hessenberg_f90 passed."
end program test_arnoldi_hessenberg_f90
