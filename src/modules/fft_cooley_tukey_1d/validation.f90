module m_fft_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use, intrinsic :: ieee_arithmetic, only: ieee_is_finite
    use m_fft_err
    implicit none
contains
    pure function validate_fft_input(n, x) result(code)
        integer, intent(in) :: n
        complex(dp), intent(in) :: x(n)
        integer :: code, i
        if (n <= 0 .or. iand(n, n - 1) /= 0) then
            code = ERR_DIM
            return
        end if
        do i = 1, n
            if (.not. ieee_is_finite(real(x(i), dp)) .or. .not. ieee_is_finite(aimag(x(i)))) then
                code = ERR_NAN
                return
            end if
        end do
        code = ERR_OK
    end function validate_fft_input
end module m_fft_val
