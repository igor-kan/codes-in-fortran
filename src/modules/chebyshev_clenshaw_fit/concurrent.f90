module m_ch_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ch_types
    use m_ch_core
    implicit none
contains
    subroutine batch_eval(ser, m, xs, ys)
        type(cheb_series_t), intent(in) :: ser
        integer, intent(in) :: m
        real(dp), intent(in) :: xs(m)
        real(dp), intent(out) :: ys(m)
        integer :: i
        do concurrent (i = 1:m)
            ys(i) = eval_clenshaw(ser, xs(i))
        end do
    end subroutine batch_eval
end module m_ch_conc
