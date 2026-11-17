module m_ab4_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: ab4_cfg_t
        real(dp) :: t0 = 0.0_dp
        real(dp) :: h = 0.05_dp
        integer :: steps = 20
    end type ab4_cfg_t
end module m_ab4_types
