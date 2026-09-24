module tempering_swap_acceptance_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: swap_accept
contains
    pure function swap_accept(dbeta, de) result(res)
        real(real64), intent(in) :: dbeta, de
        real(real64) :: res
        res = min(1.0_real64, exp(dbeta * de))
    end function swap_accept
end module tempering_swap_acceptance_f90_mod
