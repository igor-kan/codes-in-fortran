module m_lag_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_lag_err
    implicit none
contains
    pure function check_order(n) result(code)
        integer, intent(in) :: n
        integer :: code
        code = ERR_OK
        if (n < 1) code = ERR_DIM
    end function check_order
end module m_lag_val
