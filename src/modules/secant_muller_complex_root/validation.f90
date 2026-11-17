module m_sec_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sec_err
    implicit none
contains
    pure function check_tol(tol) result(c)
        real(dp), intent(in) :: tol
        integer :: c
        c = merge(ERR_OK, ERR_DIM, tol > 0.0_dp)
    end function check_tol
end module m_sec_val
