module black_scholes_intrinsic_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: call_intrinsic
contains
    pure function call_intrinsic(s, k) result(res)
        real(real64), intent(in) :: s, k
        real(real64) :: res
        res = max(s - k, 0.0_real64)
    end function call_intrinsic
end module black_scholes_intrinsic_f90_mod
