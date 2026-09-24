module bicgstab_alpha_step_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: bicgstab_alpha
contains
    pure function bicgstab_alpha(rho, rhat_v) result(res)
        real(real64), intent(in) :: rho, rhat_v
        real(real64) :: res
        res = rho / rhat_v
    end function bicgstab_alpha
end module bicgstab_alpha_step_f90_mod
