module m_gma_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gma_types
    use m_gma_core
    implicit none
contains
    pure subroutine batch_beta_cdf(m, a, b, xs, outs)
        integer, intent(in) :: m
        real(dp), intent(in) :: a, b, xs(m)
        real(dp), intent(out) :: outs(m)
        integer :: i
        type(beta_eval_t) :: tmp
        do concurrent (i = 1:m)
            tmp = reg_incomplete_beta(a, b, xs(i))
            outs(i) = tmp%value
        end do
    end subroutine batch_beta_cdf
end module m_gma_conc
