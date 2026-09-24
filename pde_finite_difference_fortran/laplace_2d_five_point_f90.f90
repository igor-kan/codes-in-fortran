module laplace_2d_five_point_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: five_point_mid
contains
    pure function five_point_mid(u_l, u_r, u_b, u_t) result(res)
        real(real64), intent(in) :: u_l, u_r, u_b, u_t
        real(real64) :: res
        res = 0.25_real64 * (u_l + u_r + u_b + u_t)
    end function five_point_mid
end module laplace_2d_five_point_f90_mod
