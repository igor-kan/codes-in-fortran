module m_gqr_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gqr_types
    use m_gqr_err
    implicit none
contains
    pure subroutine givens_coeff(a, b, c, s)
        real(dp), intent(in) :: a, b
        real(dp), intent(out) :: c, s
        real(dp) :: r
        if (b == 0.0_dp) then
            c = 1.0_dp
            s = 0.0_dp
        else if (abs(b) > abs(a)) then
            r = a / b
            s = sign(1.0_dp, b) / sqrt(1.0_dp + r * r)
            c = s * r
        else
            r = b / a
            c = sign(1.0_dp, a) / sqrt(1.0_dp + r * r)
            s = c * r
        end if
    end subroutine givens_coeff

    subroutine givens_qr_factor(m, n, a, q, r, st)
        integer, intent(in) :: m, n
        real(dp), intent(in) :: a(m, n)
        real(dp), intent(out) :: q(m, m), r(m, n)
        type(qr_status_t), intent(out) :: st
        integer :: i, j, k
        real(dp) :: c, s, t1, t2

        st%status = ERR_OK
        st%min_diag = huge(1.0_dp)
        r = a
        q = 0.0_dp
        do i = 1, m
            q(i, i) = 1.0_dp
        end do

        do j = 1, min(m, n)
            do i = m, j + 1, -1
                if (abs(r(i, j)) > 0.0_dp) then
                    call givens_coeff(r(i - 1, j), r(i, j), c, s)
                    do k = j, n
                        t1 = r(i - 1, k)
                        t2 = r(i, k)
                        r(i - 1, k) = c * t1 + s * t2
                        r(i, k) = -s * t1 + c * t2
                    end do
                    r(i, j) = 0.0_dp
                    do k = 1, m
                        t1 = q(k, i - 1)
                        t2 = q(k, i)
                        q(k, i - 1) = c * t1 + s * t2
                        q(k, i) = -s * t1 + c * t2
                    end do
                end if
            end do
            st%min_diag = min(st%min_diag, abs(r(j, j)))
        end do
        if (st%min_diag < 1.0e-14_dp) st%status = ERR_SINGULAR
    end subroutine givens_qr_factor
end module m_gqr_core
