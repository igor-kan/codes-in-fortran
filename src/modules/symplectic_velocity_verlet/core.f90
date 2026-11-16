module m_ver_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ver_types
    implicit none
contains
    pure subroutine kepler_accel(x, y, mu, ax, ay)
        real(dp), intent(in) :: x, y, mu
        real(dp), intent(out) :: ax, ay
        real(dp) :: r2, r3
        r2 = x * x + y * y
        r3 = r2 * sqrt(r2)
        ax = -mu * x / r3
        ay = -mu * y / r3
    end subroutine kepler_accel

    pure subroutine verlet_step(st, mu, dt)
        type(orbit_state_t), intent(inout) :: st
        real(dp), intent(in) :: mu, dt
        real(dp) :: ax0, ay0, ax1, ay1, vx_half, vy_half
        call kepler_accel(st%x, st%y, mu, ax0, ay0)
        vx_half = st%vx + 0.5_dp * dt * ax0
        vy_half = st%vy + 0.5_dp * dt * ay0
        st%x = st%x + dt * vx_half
        st%y = st%y + dt * vy_half
        call kepler_accel(st%x, st%y, mu, ax1, ay1)
        st%vx = vx_half + 0.5_dp * dt * ax1
        st%vy = vy_half + 0.5_dp * dt * ay1
    end subroutine verlet_step

    subroutine integrate_orbit(st, mu, dt, steps)
        type(orbit_state_t), intent(inout) :: st
        real(dp), intent(in) :: mu, dt
        integer, intent(in) :: steps
        integer :: k
        do k = 1, steps
            call verlet_step(st, mu, dt)
        end do
    end subroutine integrate_orbit
end module m_ver_core
