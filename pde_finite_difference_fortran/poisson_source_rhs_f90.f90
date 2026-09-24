module poisson_source_rhs_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: poisson_rhs
contains
    pure function poisson_rhs(dx, rho) result(res)
        real(real64), intent(in) :: dx, rho
        real(real64) :: res
        res = -dx * dx * rho
    end function poisson_rhs
end module poisson_source_rhs_f90_mod
