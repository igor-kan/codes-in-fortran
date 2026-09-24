module matrix_frobenius_norm_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: frobenius_term
contains
    pure function frobenius_term(sum_sq) result(res)
        real(real64), intent(in) :: sum_sq
        real(real64) :: res
        res = sqrt(sum_sq)
    end function frobenius_term
end module matrix_frobenius_norm_f90_mod
