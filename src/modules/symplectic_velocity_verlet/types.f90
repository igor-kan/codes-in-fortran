module m_ver_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: orbit_state_t
        real(dp) :: x = 1.0_dp
        real(dp) :: y = 0.0_dp
        real(dp) :: vx = 0.0_dp
        real(dp) :: vy = 1.0_dp
    end type orbit_state_t
end module m_ver_types
