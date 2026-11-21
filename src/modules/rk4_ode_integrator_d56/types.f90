module m_rk4_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: rk4_config
        real(dp) :: lambda = -1.0_dp
    end type rk4_config
end module m_rk4_types
