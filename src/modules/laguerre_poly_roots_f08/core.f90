module m_lag_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_lag_types
    use m_lag_err
    implicit none
contains
    pure subroutine eval_laguerre(n, x, ln, dln)
        integer, intent(in) :: n
        real(dp), intent(in) :: x
        real(dp), intent(out) :: ln, dln
        real(dp) :: p1, p2, p3
        integer :: j
        p1 = 1.0_dp
        p2 = 0.0_dp
        do j = 1, n
            p3 = p2
            p2 = p1
            p1 = ((real(2*j - 1, dp) - x) * p2 - real(j - 1, dp) * p3) / real(j, dp)
        end do
        ln = p1
        dln = real(n, dp) * (p1 - p2) / x
    end subroutine eval_laguerre

    subroutine build_gauss_laguerre(n, rule, status)
        integer, intent(in) :: n
        type(gl_rule_t), intent(out) :: rule
        integer, intent(out) :: status
        integer :: i, its
        real(dp) :: z, z1, p1, dp1, p2, p3, pp
        integer :: j
        if (n < 1) then
            status = ERR_DIM
            return
        end if
        status = ERR_OK
        rule%order = n
        allocate(rule%x(n), rule%w(n))
        z = 0.0_dp
        do i = 1, n
            if (i == 1) then
                z = 3.0_dp / (1.0_dp + 2.4_dp * real(n, dp))
            else if (i == 2) then
                z = z + 15.0_dp / (1.0_dp + 2.5_dp * real(n, dp))
            else
                z = z + ((1.0_dp + 2.55_dp * real(i - 2, dp)) / &
                    (1.9_dp * real(i - 2, dp))) * (z - rule%x(i - 2))
            end if
            do its = 1, 30
                p1 = 1.0_dp
                p2 = 0.0_dp
                do j = 1, n
                    p3 = p2
                    p2 = p1
                    p1 = ((real(2*j - 1, dp) - z) * p2 - real(j - 1, dp) * p3) / real(j, dp)
                end do
                pp = (real(n, dp) * p1 - real(n, dp) * p2) / z
                z1 = z
                z = z1 - p1 / pp
                if (abs(z - z1) <= 1.0e-14_dp) exit
            end do
            rule%x(i) = z
            dp1 = real(n, dp) * (p1 - p2) / z
            rule%w(i) = 1.0_dp / (z * dp1 * dp1)
        end do
    end subroutine build_gauss_laguerre
end module m_lag_core
