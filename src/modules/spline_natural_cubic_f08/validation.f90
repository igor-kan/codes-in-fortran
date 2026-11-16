module m_spl_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_spl_err
    implicit none
contains
    pure function validate_knots(n, x) result(code)
        integer, intent(in) :: n
        real(dp), intent(in) :: x(n)
        integer :: code, i
        if (n < 3) then
            code = ERR_DIM
            return
        end if
        do i = 2, n
            if (x(i) <= x(i - 1)) then
                code = ERR_SING
                return
            end if
        end do
        code = ERR_OK
    end function validate_knots
end module m_spl_val
