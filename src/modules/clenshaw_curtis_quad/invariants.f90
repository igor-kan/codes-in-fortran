module m_ccq_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function check_weight_sum(n, a, b, weights) result(err)
        integer, intent(in) :: n
        real(dp), intent(in) :: a, b, weights(0:n)
        real(dp) :: err
        err = abs(sum(weights) - (b - a))
    end function check_weight_sum

    pure function check_weight_symmetry(n, weights) result(err)
        integer, intent(in) :: n
        real(dp), intent(in) :: weights(0:n)
        real(dp) :: err
        integer :: k
        err = 0.0_dp
        do k = 0, n / 2
            err = max(err, abs(weights(k) - weights(n - k)))
        end do
    end function check_weight_symmetry
end module m_ccq_inv
