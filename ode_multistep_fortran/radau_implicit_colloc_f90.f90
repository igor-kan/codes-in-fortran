module radau_implicit_colloc_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: radau_weight
contains
    pure function radau_weight(c) result(res)
        real(real64), intent(in) :: c
        real(real64) :: res
        res = c
    end function radau_weight
end module radau_implicit_colloc_f90_mod
