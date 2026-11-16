module m_bes_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use, intrinsic :: ieee_arithmetic, only: ieee_is_finite
    use m_bes_err
    implicit none
contains
    pure function validate_pos_arg(x) result(code)
        real(dp), intent(in) :: x
        integer :: code
        if (.not. ieee_is_finite(x) .or. x <= 0.0_dp) then
            code = ERR_DIM
        else
            code = ERR_OK
        end if
    end function validate_pos_arg
end module m_bes_val
