module m_brg_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_brg_types
    use m_brg_err
    implicit none
contains
    pure function validate_burgers_params(n, p) result(code)
        integer, intent(in) :: n
        type(burgers_params_t), intent(in) :: p
        integer :: code
        if (n < 8 .or. p%dx <= 0.0_dp .or. p%dt <= 0.0_dp) then
            code = ERR_DIM
        else if (p%viscosity < 0.0_dp) then
            code = ERR_NAN
        else
            code = ERR_OK
        end if
    end function validate_burgers_params
end module m_brg_val
