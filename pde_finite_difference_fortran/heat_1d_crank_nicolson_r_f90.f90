module heat_1d_crank_nicolson_r_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: cn_diffusion_r
contains
    pure function cn_diffusion_r(alpha, dt, dx) result(res)
        real(real64), intent(in) :: alpha, dt, dx
        real(real64) :: res
        res = alpha * dt / (2.0_real64 * dx * dx)
    end function cn_diffusion_r
end module heat_1d_crank_nicolson_r_f90_mod
