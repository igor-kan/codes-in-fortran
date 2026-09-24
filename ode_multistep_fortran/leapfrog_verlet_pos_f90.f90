module leapfrog_verlet_pos_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: verlet_pos
contains
    pure function verlet_pos(x, v, dt) result(res)
        real(real64), intent(in) :: x, v, dt
        real(real64) :: res
        res = x + dt * v
    end function verlet_pos
end module leapfrog_verlet_pos_f90_mod
