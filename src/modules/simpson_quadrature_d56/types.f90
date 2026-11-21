module m_simp_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: quad_grid
        real(dp) :: a = 0.0_dp
        real(dp) :: b = 1.0_dp
    end type quad_grid
end module m_simp_types
