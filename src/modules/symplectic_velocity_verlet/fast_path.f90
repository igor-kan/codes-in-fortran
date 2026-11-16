module m_ver_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ver_types
    implicit none
contains
    pure function kepler_energy(st, mu) result(e)
        type(orbit_state_t), intent(in) :: st
        real(dp), intent(in) :: mu
        real(dp) :: e, r
        r = sqrt(st%x * st%x + st%y * st%y)
        e = 0.5_dp * (st%vx * st%vx + st%vy * st%vy) - mu / r
    end function kepler_energy

    pure function angular_momentum(st) result(lz)
        type(orbit_state_t), intent(in) :: st
        real(dp) :: lz
        lz = st%x * st%vy - st%y * st%vx
    end function angular_momentum
end module m_ver_fast
