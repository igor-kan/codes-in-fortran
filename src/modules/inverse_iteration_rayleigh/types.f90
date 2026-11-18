module m_rqi_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: eig2_t
        real(dp) :: lam = 0.0_dp
        real(dp) :: v(2) = 0.0_dp
    end type eig2_t
end module m_rqi_types
