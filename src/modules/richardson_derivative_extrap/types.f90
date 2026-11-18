module m_rde_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
type :: diff_res_t
        real(dp) :: deriv = 0.0_dp
        real(dp) :: err_est = 0.0_dp
    end type diff_res_t
end module m_rde_types
