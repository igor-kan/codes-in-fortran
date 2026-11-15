module m_gqr_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    function qr_recon_error(m, n, a, q, r) result(err)
        integer, intent(in) :: m, n
        real(dp), intent(in) :: a(m, n), q(m, m), r(m, n)
        real(dp) :: err
        err = sqrt(sum((a - matmul(q, r)) ** 2))
    end function qr_recon_error

    function q_ortho_error(m, q) result(err)
        integer, intent(in) :: m
        real(dp), intent(in) :: q(m, m)
        real(dp) :: err, qtq(m, m)
        integer :: i
        qtq = matmul(transpose(q), q)
        do i = 1, m
            qtq(i, i) = qtq(i, i) - 1.0_dp
        end do
        err = sqrt(sum(qtq ** 2))
    end function q_ortho_error
end module m_gqr_inv
