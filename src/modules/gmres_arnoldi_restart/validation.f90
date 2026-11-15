module m_gmr_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use, intrinsic :: ieee_arithmetic, only: ieee_is_finite
    use m_gmr_types
    use m_gmr_err
    implicit none
contains
    pure function validate_gmres_inputs(n, a, b, cfg) result(code)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), b(n)
        type(gmres_config_t), intent(in) :: cfg
        integer :: code, i, j
        if (n <= 0 .or. cfg%restart_m <= 0) then
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
    end function validate_gmres_inputs
end module m_gmr_val
