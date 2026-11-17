module m_ldlt_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ldlt_types
    use m_ldlt_err
    implicit none
contains
    subroutine ldlt_factor(n, a, lmat, dvec, inrt)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n)
        real(dp), intent(out) :: lmat(n, n), dvec(n)
        type(ldlt_inertia_t), intent(out) :: inrt
        real(dp) :: s
        integer :: i, j, k

        lmat = 0.0_dp
        dvec = 0.0_dp
        inrt = ldlt_inertia_t(0, 0, ERR_OK)
        do j = 1, n
            lmat(j, j) = 1.0_dp
            s = 0.0_dp
            do k = 1, j - 1
                s = s + (lmat(j, k) ** 2) * dvec(k)
            end do
            dvec(j) = a(j, j) - s
            if (abs(dvec(j)) < 1.0e-14_dp) then
                inrt%status = ERR_SING
                return
            end if
            if (dvec(j) > 0.0_dp) then
                inrt%pos = inrt%pos + 1
            else
                inrt%neg = inrt%neg + 1
            end if
            do i = j + 1, n
                s = 0.0_dp
                do k = 1, j - 1
                    s = s + lmat(i, k) * lmat(j, k) * dvec(k)
                end do
                lmat(i, j) = (a(i, j) - s) / dvec(j)
            end do
        end do
    end subroutine ldlt_factor

    subroutine ldlt_solve(n, lmat, dvec, b, x)
        integer, intent(in) :: n
        real(dp), intent(in) :: lmat(n, n), dvec(n), b(n)
        real(dp), intent(out) :: x(n)
        real(dp) :: y(n)
        integer :: i, j
        do i = 1, n
            y(i) = b(i)
            do j = 1, i - 1
                y(i) = y(i) - lmat(i, j) * y(j)
            end do
        end do
        do i = 1, n
            x(i) = y(i) / dvec(i)
        end do
        do i = n, 1, -1
            do j = i + 1, n
                x(i) = x(i) - lmat(j, i) * x(j)
            end do
        end do
    end subroutine ldlt_solve
end module m_ldlt_core
