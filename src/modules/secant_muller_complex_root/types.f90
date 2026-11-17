module m_sec_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: root_res_t
        real(dp) :: x = 0.0_dp
        real(dp) :: fx = 0.0_dp
        integer :: iters = 0
        integer :: status = 0
    end type root_res_t
end module m_sec_types
