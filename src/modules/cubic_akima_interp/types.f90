module m_akm_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: akima_seg_t
        real(dp) :: x0 = 0.0_dp
        real(dp) :: c0 = 0.0_dp
        real(dp) :: c1 = 0.0_dp
        real(dp) :: c2 = 0.0_dp
        real(dp) :: c3 = 0.0_dp
    end type akima_seg_t
end module m_akm_types
