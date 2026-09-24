module gillespie_hazard_sum_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: total_hazard
contains
    pure function total_hazard(a1, a2) result(res)
        real(real64), intent(in) :: a1, a2
        real(real64) :: res
        res = a1 + a2
    end function total_hazard
end module gillespie_hazard_sum_f90_mod
