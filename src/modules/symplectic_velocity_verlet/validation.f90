module m_ver_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ver_types
    use m_ver_err
    implicit none
contains
    pure function validate_orbit_init(st, mu, dt) result(code)
        type(orbit_state_t), intent(in) :: st
        real(dp), intent(in) :: mu, dt
        integer :: code
        if (mu <= 0.0_dp .or. dt == 0.0_dp .or. (st%x * st%x + st%y * st%y) <= 0.0_dp) then
            code = ERR_DIM
        else
            code = ERR_OK
        end if
    end function validate_orbit_init
end module m_ver_val
