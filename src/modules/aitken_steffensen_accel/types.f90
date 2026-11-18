module m_ait_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: aitken_res_t
        real(dp) :: root = 0.0_dp
        integer :: steps = 0
    end type aitken_res_t
end module m_ait_types
