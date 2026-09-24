module lanczos_alpha_step_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: lanczos_alpha
contains
    pure function lanczos_alpha(v_Av, norm_sq) result(res)
        real(real64), intent(in) :: v_Av, norm_sq
        real(real64) :: res
        res = v_Av / norm_sq
    end function lanczos_alpha
end module lanczos_alpha_step_f90_mod
