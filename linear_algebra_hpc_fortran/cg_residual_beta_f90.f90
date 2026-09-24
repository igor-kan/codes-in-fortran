module cg_residual_beta_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: cg_beta_step
contains
    pure function cg_beta_step(r_new, r_old) result(res)
        real(real64), intent(in) :: r_new, r_old
        real(real64) :: res
        res = r_new / r_old
    end function cg_beta_step
end module cg_residual_beta_f90_mod
