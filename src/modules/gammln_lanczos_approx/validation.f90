module m_gma_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gma_err
    implicit none
contains
    pure function validate_beta_args(a, b, x) result(code)
        real(dp), intent(in) :: a, b, x
        integer :: code
        if (a <= 0.0_dp .or. b <= 0.0_dp) then
            code = ERR_DIM
        else if (x < 0.0_dp .or. x > 1.0_dp) then
            code = ERR_DIM
        else
            code = ERR_OK
        end if
    end function validate_beta_args
end module m_gma_val
