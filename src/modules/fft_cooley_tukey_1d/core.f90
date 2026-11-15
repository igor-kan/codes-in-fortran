module m_fft_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_fft_types
    use m_fft_err
    implicit none
contains
    subroutine init_fft_plan(n, inverse, plan, status)
        integer, intent(in) :: n
        logical, intent(in) :: inverse
        type(fft_plan_t), intent(out) :: plan
        integer, intent(out) :: status
        integer :: v, lg
        if (n <= 0 .or. iand(n, n - 1) /= 0) then
            status = ERR_DIM
            return
        end if
        lg = 0
        v = n
        do while (v > 1)
            v = v / 2
            lg = lg + 1
        end do
        plan%length = n
        plan%log2_n = lg
        plan%inverse = inverse
        status = ERR_OK
    end subroutine init_fft_plan

    subroutine fft_execute(plan, buf, status)
        type(fft_plan_t), intent(in) :: plan
        complex(dp), intent(inout) :: buf(plan%length)
        integer, intent(out) :: status
        integer :: n, i, j, bit, m_len, half_m, k
        real(dp) :: angle, pi, dir_sign
        complex(dp) :: wlen, w, u, t, tmp

        n = plan%length
        if (n <= 0 .or. iand(n, n - 1) /= 0) then
            status = ERR_DIM
            return
        end if
        status = ERR_OK
        j = 0
        do i = 1, n - 1
            bit = n / 2
            do while (iand(j, bit) /= 0)
                j = ieor(j, bit)
                bit = bit / 2
            end do
            j = ieor(j, bit)
            if (i < j) then
                tmp = buf(i + 1)
                buf(i + 1) = buf(j + 1)
                buf(j + 1) = tmp
            end if
        end do

        pi = 4.0_dp * atan(1.0_dp)
        dir_sign = merge(1.0_dp, -1.0_dp, plan%inverse)
        m_len = 2
        do while (m_len <= n)
            half_m = m_len / 2
            angle = dir_sign * 2.0_dp * pi / real(m_len, dp)
            wlen = cmplx(cos(angle), sin(angle), kind=dp)
            do i = 1, n, m_len
                w = (1.0_dp, 0.0_dp)
                do k = 0, half_m - 1
                    u = buf(i + k)
                    t = w * buf(i + k + half_m)
                    buf(i + k) = u + t
                    buf(i + k + half_m) = u - t
                    w = w * wlen
                end do
            end do
            m_len = m_len * 2
        end do

        if (plan%inverse) then
            buf = buf / real(n, dp)
        end if
    end subroutine fft_execute
end module m_fft_core
