module m_ccq_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ccq_types
    use m_ccq_ifc
    use m_ccq_err
    implicit none
contains
    subroutine clenshaw_curtis_rule(n, a, b, nodes, weights, status)
        integer, intent(in) :: n
        real(dp), intent(in) :: a, b
        real(dp), intent(out) :: nodes(0:n), weights(0:n)
        integer, intent(out) :: status
        real(dp) :: pi, theta, w_acc, bj, mid, half
        integer :: k, j

        if (n < 2 .or. mod(n, 2) /= 0 .or. b <= a) then
            status = ERR_DIM
            return
        end if
        status = ERR_OK
        pi = 4.0_dp * atan(1.0_dp)
        mid = 0.5_dp * (a + b)
        half = 0.5_dp * (b - a)
        do k = 0, n
            theta = real(k, dp) * pi / real(n, dp)
            nodes(k) = mid - half * cos(theta)
            w_acc = 1.0_dp
            do j = 1, n / 2
                bj = merge(1.0_dp, 2.0_dp, 2 * j == n)
                w_acc = w_acc - bj * cos(2.0_dp * real(j, dp) * theta) / real(4 * j * j - 1, dp)
            end do
            if (k == 0 .or. k == n) then
                weights(k) = half * w_acc / real(n, dp)
            else
                weights(k) = 2.0_dp * half * w_acc / real(n, dp)
            end if
        end do
    end subroutine clenshaw_curtis_rule

    pure function integrate_cc(n, nodes, weights, fn) result(integral)
        integer, intent(in) :: n
        real(dp), intent(in) :: nodes(0:n), weights(0:n)
        procedure(integrand_iface) :: fn
        real(dp) :: integral
        integer :: k
        integral = 0.0_dp
        do k = 0, n
            integral = integral + weights(k) * fn(nodes(k))
        end do
    end function integrate_cc
end module m_ccq_core
