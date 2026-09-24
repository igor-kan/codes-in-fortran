module thomas_tridiag_c_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: thomas_c
contains
    pure function thomas_c(c, b, a, cp) result(res)
        real(real64), intent(in) :: c, b, a, cp
        real(real64) :: res
        res = c / (b - a * cp)
    end function thomas_c
end module thomas_tridiag_c_f90_mod
