module doolittle_pivot_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: doolittle_mult
contains
    pure function doolittle_mult(a_ik, u_kk) result(res)
        real(real64), intent(in) :: a_ik, u_kk
        real(real64) :: res
        res = a_ik / u_kk
    end function doolittle_mult
end module doolittle_pivot_f90_mod
