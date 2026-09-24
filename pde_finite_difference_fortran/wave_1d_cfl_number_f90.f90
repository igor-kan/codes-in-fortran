module wave_1d_cfl_number_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: cfl_number
contains
    pure function cfl_number(c, dt, dx) result(res)
        real(real64), intent(in) :: c, dt, dx
        real(real64) :: res
        res = c * dt / dx
    end function cfl_number
end module wave_1d_cfl_number_f90_mod
