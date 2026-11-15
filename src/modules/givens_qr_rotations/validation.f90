module m_gqr_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use, intrinsic :: ieee_arithmetic, only: ieee_is_finite
    use m_gqr_err
    implicit none
contains
    pure function validate_qr_shape(m, n, a) result(code)
        integer, intent(in) :: m, n
        real(dp), intent(in) :: a(m, n)
        integer :: code, i, j
        if (m <= 0 .or. n <= 0 .or. m < n) then
            code = ERR_DIM
            return
        end if
        do j = 1, n
            do i = 1, m
                if (.not. ieee_is_finite(a(i, j))) then
                    code = ERR_NAN
                    return
                end if
            end do
        end do
        code = ERR_OK
    end function validate_qr_shape
end module m_gqr_val
