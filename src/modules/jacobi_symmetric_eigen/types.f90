module m_jcb_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: eigen_config_t
        integer :: max_sweeps = 60
        real(dp) :: tol = 1.0e-12_dp
    end type eigen_config_t
    type :: eigen_report_t
        integer :: sweeps = 0
        integer :: status = 0
        real(dp) :: off_diag_norm = 0.0_dp
    end type eigen_report_t
end module m_jcb_types
