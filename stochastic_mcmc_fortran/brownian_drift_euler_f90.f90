module brownian_drift_euler_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: brownian_step
contains
    pure function brownian_step(x, mu, dt) result(res)
        real(real64), intent(in) :: x, mu, dt
        real(real64) :: res
        res = x + mu * dt
    end function brownian_step
end module brownian_drift_euler_f90_mod
