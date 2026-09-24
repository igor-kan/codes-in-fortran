module jacobi_rotation_angle_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: jacobi_angle
contains
    pure function jacobi_angle(a_ii, a_jj, a_ij) result(res)
        real(real64), intent(in) :: a_ii, a_jj, a_ij
        real(real64) :: res
        res = 0.5_real64 * atan2(2.0_real64 * a_ij, a_jj - a_ii)
    end function jacobi_angle
end module jacobi_rotation_angle_f90_mod
