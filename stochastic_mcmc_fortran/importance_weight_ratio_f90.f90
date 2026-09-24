module importance_weight_ratio_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: imp_weight
contains
    pure function imp_weight(p, q) result(res)
        real(real64), intent(in) :: p, q
        real(real64) :: res
        res = p / q
    end function imp_weight
end module importance_weight_ratio_f90_mod
