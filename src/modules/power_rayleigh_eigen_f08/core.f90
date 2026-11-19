module m_poweig_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_poweig_types
    use m_poweig_err
    use m_poweig_ifc
    implicit none
contains
pure function dominant_eig_3x3(A, v0, iters) result(lam)
        real(dp), intent(in) :: A(3, 3), v0(3)
        integer, intent(in) :: iters
        real(dp) :: lam, v(3), w(3)
        integer :: k
        v = v0 / sqrt(sum(v0 * v0))
        do k = 1, iters
            w = matmul(A, v)
            v = w / sqrt(sum(w * w))
        end do
        lam = dot_product(v, matmul(A, v))
    end function dominant_eig_3x3
end module m_poweig_core
