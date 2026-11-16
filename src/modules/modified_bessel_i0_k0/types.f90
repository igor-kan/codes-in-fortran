module m_bes_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: bessel_quad_t
        real(dp) :: i0 = 0.0_dp
        real(dp) :: i1 = 0.0_dp
        real(dp) :: k0 = 0.0_dp
        real(dp) :: k1 = 0.0_dp
    end type bessel_quad_t
end module m_bes_types
