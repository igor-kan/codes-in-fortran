module m_pwr_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_pwr_err
    implicit none
contains
    pure function validate_power_args(n, k, a) result(code)
        integer, intent(in) :: n, k
        real(dp), intent(in) :: a(n, n)
        integer :: code, i, j
        if (n <= 0 .or. k <= 0 .or. k > n) then
            code = ERR_DIM
            return
        end if
        do j = 1, n
            do i = j + 1, n
                if (abs(a(i, j) - a(j, i)) > 1.0e-9_dp) then
                    code = ERR_SING
                    return
                end if
            end do
        end do
        code = ERR_OK
    end function validate_power_args
end module m_pwr_val
