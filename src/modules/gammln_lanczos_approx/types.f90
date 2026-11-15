module m_gma_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: beta_eval_t
        real(dp) :: value = 0.0_dp
        integer :: cf_iters = 0
        integer :: status = 0
    end type beta_eval_t
end module m_gma_types
