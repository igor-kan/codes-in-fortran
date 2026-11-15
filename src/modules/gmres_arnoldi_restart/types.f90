module m_gmr_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: gmres_config_t
        integer :: restart_m = 16
        integer :: max_restarts = 20
        real(dp) :: tol = 1.0e-10_dp
    end type gmres_config_t
    type :: gmres_report_t
        integer :: total_iters = 0
        integer :: status = 0
        real(dp) :: residual_norm = 0.0_dp
    end type gmres_report_t
end module m_gmr_types
