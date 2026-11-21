module m_poweig_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_poweig_types
    use m_poweig_err
    use m_poweig_ifc
    implicit none
contains
function dominant_eigval(a, n, iters) result(lam)
        integer, intent(in) :: n, iters
        real(dp), intent(in) :: a(n, n)
        real(dp) :: lam, v(n), w(n), nrm
        integer :: k
        v = 1.0_dp / sqrt(real(n, dp))
        lam = 0.0_dp
        do k = 1, iters
            w = matmul(a, v)
            nrm = sqrt(sum(w * w))
            v = w / nrm
            lam = dot_product(v, matmul(a, v))
        end do
    end function dominant_eigval
end module m_poweig_core
