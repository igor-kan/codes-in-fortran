module chebyshev_t_eval_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: chebyshev_t
contains
    pure function chebyshev_t(t1, t0, x) result(t2)
        real(real64), intent(in) :: t1, t0, x
        real(real64) :: t2
        t2 = 2.0_real64 * x * t1 - t0
    end function chebyshev_t
end module chebyshev_t_eval_f90_mod
