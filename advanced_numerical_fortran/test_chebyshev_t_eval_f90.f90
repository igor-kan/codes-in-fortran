program test_chebyshev_t_eval_f90
    use chebyshev_t_eval_f90_mod, only: chebyshev_t
    implicit none
    if (chebyshev_t(1.0, 1.0, 1.0) /= 1.0) stop 1
    write(*,*) "test_chebyshev_t_eval_f90 passed."
end program test_chebyshev_t_eval_f90
