module m_cgf_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: cg_config_t
        integer :: max_iter = 500
        real(dp) :: tol = 1.0e-11_dp
    end type cg_config_t
    type :: cg_report_t
        integer :: status = 0
        integer :: iters = 0
        real(dp) :: rel_residual = 0.0_dp
    end type cg_report_t
end module m_cgf_types
