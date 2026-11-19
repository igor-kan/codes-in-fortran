module m_gl3_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: gl3_res_t
        real(dp) :: integral = 0.0_dp
    end type gl3_res_t
end module m_gl3_types
