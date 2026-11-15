module m_sor_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: sor_config_t
        real(dp) :: omega = 1.75_dp
        real(dp) :: tol = 1.0e-9_dp
        integer :: max_iter = 4000
    end type sor_config_t
    type :: sor_report_t
        integer :: iters = 0
        integer :: status = 0
        real(dp) :: max_residual = 0.0_dp
    end type sor_report_t
end module m_sor_types
