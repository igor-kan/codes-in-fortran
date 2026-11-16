module m_ver_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ver_types
    use m_ver_core
    use m_ver_fast
    implicit none
contains
    pure subroutine batch_energy_drifts(n, vy0, mu, dt, steps, drifts)
        integer, intent(in) :: n, steps
        real(dp), intent(in) :: vy0(n), mu, dt
        real(dp), intent(out) :: drifts(n)
        type(orbit_state_t) :: st
        real(dp) :: e0
        integer :: i, k
        do concurrent (i = 1:n)
            st = orbit_state_t(1.0_dp, 0.0_dp, 0.0_dp, vy0(i))
            e0 = kepler_energy(st, mu)
            do k = 1, steps
                call verlet_step(st, mu, dt)
            end do
            drifts(i) = abs(kepler_energy(st, mu) - e0)
        end do
    end subroutine batch_energy_drifts
end module m_ver_conc
