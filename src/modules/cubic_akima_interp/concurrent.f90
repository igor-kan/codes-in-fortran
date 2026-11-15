module m_akm_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_akm_types
    use m_akm_core
    implicit none
contains
    pure subroutine batch_eval_akima(n, segs, m, xq, yq)
        integer, intent(in) :: n, m
        type(akima_seg_t), intent(in) :: segs(n - 1)
        real(dp), intent(in) :: xq(m)
        real(dp), intent(out) :: yq(m)
        integer :: i
        do concurrent (i = 1:m)
            yq(i) = eval_akima(n, segs, xq(i))
        end do
    end subroutine batch_eval_akima
end module m_akm_conc
