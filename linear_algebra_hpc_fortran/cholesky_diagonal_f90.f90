module cholesky_diagonal_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: chol_diag
contains
    pure function chol_diag(a_ii, s) result(res)
        real(real64), intent(in) :: a_ii, s
        real(real64) :: res
        res = sqrt(a_ii - s)
    end function chol_diag
end module cholesky_diagonal_f90_mod
