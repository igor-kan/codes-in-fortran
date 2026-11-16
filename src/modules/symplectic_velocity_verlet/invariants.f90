module m_ver_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ver_types
    use m_ver_fast
    implicit none
contains
    function check_symplectic_laws(st0, st1, mu, etol, ltol) result(ok)
        type(orbit_state_t), intent(in) :: st0, st1
        real(dp), intent(in) :: mu, etol, ltol
        logical :: ok
        ok = (abs(kepler_energy(st1, mu) - kepler_energy(st0, mu)) <= etol .and. &
              abs(angular_momentum(st1) - angular_momentum(st0)) <= ltol)
    end function check_symplectic_laws
end module m_ver_inv
