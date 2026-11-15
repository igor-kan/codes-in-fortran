module m_ccq_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ccq_err
    implicit none
contains
    pure function validate_interval(n, a, b) result(code)
        integer, intent(in) :: n
        real(dp), intent(in) :: a, b
        integer :: code
        if (n < 2 .or. mod(n, 2) /= 0 .or. b <= a) then
            code = ERR_DIM
        else
            code = ERR_OK
        end if
    end function validate_interval
end module m_ccq_val
