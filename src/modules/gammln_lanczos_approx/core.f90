module m_gma_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gma_types
    use m_gma_err
    implicit none
contains
    pure function log_gamma_lanczos(z) result(lg)
        real(dp), intent(in) :: z
        real(dp) :: lg, x, y, ser, tmp
        real(dp), parameter :: cof(6) = [ &
             76.18009172947146_dp, -86.50532032941677_dp, &
             24.01409824083091_dp,  -1.231739572450155_dp, &
             0.1208650973866179e-2_dp, -0.5395239384953e-5_dp ]
        integer :: j
        y = z
        x = z
        tmp = x + 5.5_dp
        tmp = (x + 0.5_dp) * log(tmp) - tmp
        ser = 1.000000000190015_dp
        do j = 1, 6
            y = y + 1.0_dp
            ser = ser + cof(j) / y
        end do
        lg = tmp + log(2.5066282746310005_dp * ser / x)
    end function log_gamma_lanczos

    pure subroutine betacf_lentz(a, b, x, val, iters, status)
        real(dp), intent(in) :: a, b, x
        real(dp), intent(out) :: val
        integer, intent(out) :: iters, status
        real(dp), parameter :: tiny_v = 1.0e-30_dp, eps = 3.0e-14_dp
        real(dp) :: qab, qap, qam, c, d, h, aa, del, m2
        integer :: m

        status = ERR_OK
        qab = a + b
        qap = a + 1.0_dp
        qam = a - 1.0_dp
        c = 1.0_dp
        d = 1.0_dp - qab * x / qap
        if (abs(d) < tiny_v) d = tiny_v
        d = 1.0_dp / d
        h = d
        do m = 1, 200
            m2 = real(2 * m, dp)
            aa = real(m, dp) * (b - real(m, dp)) * x / ((qam + m2) * (a + m2))
            d = 1.0_dp + aa * d
            if (abs(d) < tiny_v) d = tiny_v
            c = 1.0_dp + aa / c
            if (abs(c) < tiny_v) c = tiny_v
            d = 1.0_dp / d
            h = h * d * c
            aa = -(a + real(m, dp)) * (qab + real(m, dp)) * x / ((a + m2) * (qap + m2))
            d = 1.0_dp + aa * d
            if (abs(d) < tiny_v) d = tiny_v
            c = 1.0_dp + aa / c
            if (abs(c) < tiny_v) c = tiny_v
            d = 1.0_dp / d
            del = d * c
            h = h * del
            iters = m
            if (abs(del - 1.0_dp) <= eps) then
                val = h
                return
            end if
        end do
        val = h
        status = ERR_NO_CONV
    end subroutine betacf_lentz

    pure function reg_incomplete_beta(a, b, x) result(res)
        real(dp), intent(in) :: a, b, x
        type(beta_eval_t) :: res
        real(dp) :: bt, cf_val
        integer :: iters, st
        if (a <= 0.0_dp .or. b <= 0.0_dp .or. x < 0.0_dp .or. x > 1.0_dp) then
            res%status = ERR_DIM
            return
        end if
        if (x == 0.0_dp .or. x == 1.0_dp) then
            res%value = x
            res%status = ERR_OK
            return
        end if
        bt = exp(log_gamma_lanczos(a + b) - log_gamma_lanczos(a) - log_gamma_lanczos(b) + &
                 a * log(x) + b * log(1.0_dp - x))
        if (x < (a + 1.0_dp) / (a + b + 2.0_dp)) then
            call betacf_lentz(a, b, x, cf_val, iters, st)
            res%value = bt * cf_val / a
        else
            call betacf_lentz(b, a, 1.0_dp - x, cf_val, iters, st)
            res%value = 1.0_dp - bt * cf_val / b
        end if
        res%cf_iters = iters
        res%status = st
    end function reg_incomplete_beta
end module m_gma_core
