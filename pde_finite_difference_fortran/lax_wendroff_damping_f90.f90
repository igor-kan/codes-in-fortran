module lax_wendroff_damping_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: lw_damping
contains
    pure function lw_damping(cfl) result(res)
        real(real64), intent(in) :: cfl
        real(real64) :: res
        res = 0.5_real64 * cfl * cfl
    end function lw_damping
end module lax_wendroff_damping_f90_mod
