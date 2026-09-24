module wang_landau_entropy_step_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: wl_entropy
contains
    pure function wl_entropy(s, f) result(res)
        real(real64), intent(in) :: s, f
        real(real64) :: res
        res = s + f
    end function wl_entropy
end module wang_landau_entropy_step_f90_mod
