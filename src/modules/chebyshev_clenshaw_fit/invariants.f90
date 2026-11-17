module m_ch_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ch_types
    use m_ch_core
    implicit none
contains
    subroutine verify_exact_on_grid(ser, n, xs, ys)
        type(cheb_series_t), intent(in) :: ser
        integer, intent(in) :: n
        real(dp), intent(in) :: xs(0:n), ys(0:n)
        integer :: k
        do k = 0, n
            if (abs(eval_clenshaw(ser, xs(k)) - ys(k)) > 1.0e-11_dp) error stop 'Cheb fit residual'
        end do
    end subroutine verify_exact_on_grid
end module m_ch_inv
