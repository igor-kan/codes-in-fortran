module m_ch_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ch_types
    use m_ch_err
    implicit none
contains
    subroutine fit_chebyshev_nodes(n, fvals, ser, status)
        integer, intent(in) :: n
        real(dp), intent(in) :: fvals(0:n)
        type(cheb_series_t), intent(out) :: ser
        integer, intent(out) :: status
        real(dp), parameter :: pi = 3.14159265358979323846_dp
        integer :: j, k
        real(dp) :: s
        if (n < 1) then
            status = ERR_DIM
            return
        end if
        status = ERR_OK
        ser%deg = n
        allocate(ser%c(0:n))
        do j = 0, n
            s = 0.0_dp
            do k = 0, n
                s = s + fvals(k) * cos(real(j, dp) * (real(k, dp) + 0.5_dp) * pi / real(n + 1, dp))
            end do
            ser%c(j) = (2.0_dp / real(n + 1, dp)) * s
        end do
        ser%c(0) = 0.5_dp * ser%c(0)
    end subroutine fit_chebyshev_nodes

    pure function eval_clenshaw(ser, x) result(val)
        type(cheb_series_t), intent(in) :: ser
        real(dp), intent(in) :: x
        real(dp) :: val, b1, b2, b0
        integer :: k
        b1 = 0.0_dp
        b2 = 0.0_dp
        do k = ser%deg, 1, -1
            b0 = 2.0_dp * x * b1 - b2 + ser%c(k)
            b2 = b1
            b1 = b0
        end do
        val = x * b1 - b2 + ser%c(0)
    end function eval_clenshaw
end module m_ch_core
