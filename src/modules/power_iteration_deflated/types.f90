module m_pwr_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: power_opts_t
        integer :: max_iter = 1200
        real(dp) :: tol = 1.0e-11_dp
    end type power_opts_t
end module m_pwr_types
