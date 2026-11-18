module m_rqi_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rqi_types
    use m_rqi_err
    use m_rqi_ifc
    implicit none
contains
pure subroutine rayleigh_2x2(A, v0, steps, out)
        real(dp), intent(in) :: A(2, 2), v0(2)
        integer, intent(in) :: steps
        type(eig2_t), intent(out) :: out
        real(dp) :: v(2), w(2), mu, m11, m12, m21, m22, det, nrm
        integer :: k
        v = v0 / sqrt(sum(v0 * v0))
        mu = dot_product(v, matmul(A, v))
        do k = 1, steps
            m11 = A(1, 1) - mu + 1.0e-12_dp; m12 = A(1, 2)
            m21 = A(2, 1);                   m22 = A(2, 2) - mu + 1.0e-12_dp
            det = m11 * m22 - m12 * m21
            if (abs(det) < 1.0e-24_dp) exit
            w(1) = ( m22 * v(1) - m12 * v(2)) / det
            w(2) = (-m21 * v(1) + m11 * v(2)) / det
            nrm = sqrt(sum(w * w))
            v = w / nrm
            mu = dot_product(v, matmul(A, v))
        end do
        out = eig2_t(mu, v)
    end subroutine rayleigh_2x2
end module m_rqi_core
