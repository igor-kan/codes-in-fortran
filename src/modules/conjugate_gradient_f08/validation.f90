module m_cgf_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use, intrinsic :: ieee_arithmetic, only: ieee_is_finite
    use m_cgf_err
    implicit none
contains
    pure function validate_spd_inputs(n, a, b) result(code)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), b(n)
        integer :: code, i, j
        if (n <= 0) then
            code = ERR_DIM
            return
        end if
        do j = 1, n
            if (.not. ieee_is_finite(b(j))) then
                code = ERR_NAN
                return
            end if
            do i = 1, n
                if (.not. ieee_is_finite(a(i, j))) then
                    code = ERR_NAN
                    return
                end if
            end do
        end do
        code = ERR_OK
    end function validate_spd_inputs
end module m_cgf_val
