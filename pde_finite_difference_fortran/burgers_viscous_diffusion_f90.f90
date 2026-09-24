module burgers_viscous_diffusion_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: burgers_diff
contains
    pure function burgers_diff(nu, d2u) result(res)
        real(real64), intent(in) :: nu, d2u
        real(real64) :: res
        res = nu * d2u
    end function burgers_diff
end module burgers_viscous_diffusion_f90_mod
