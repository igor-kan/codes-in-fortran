program test_fourier_chebyshev_fast_f90
    use fourier_chebyshev_fast_f90_mod, only: cheb_fourier_angle
    implicit none
    if (cheb_fourier_angle(0.0, 5) /= 1.0) stop 1
    write(*,*) "test_fourier_chebyshev_fast_f90 passed."
end program test_fourier_chebyshev_fast_f90
