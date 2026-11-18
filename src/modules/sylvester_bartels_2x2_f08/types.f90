module m_syl_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: sylvester2_t
        real(dp) :: X(2, 2) = 0.0_dp
    end type sylvester2_t
end module m_syl_types
