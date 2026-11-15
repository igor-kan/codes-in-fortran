module m_sor_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sor_types
    use m_sor_err
    implicit none
contains
    pure function validate_sor_setup(nx, ny, h, cfg) result(code)
        integer, intent(in) :: nx, ny
        real(dp), intent(in) :: h
        type(sor_config_t), intent(in) :: cfg
        integer :: code
        if (nx < 3 .or. ny < 3 .or. h <= 0.0_dp) then
            code = ERR_DIM
        else if (cfg%omega <= 0.0_dp .or. cfg%omega >= 2.0_dp) then
            code = ERR_NAN
        else
            code = ERR_OK
        end if
    end function validate_sor_setup
end module m_sor_val
