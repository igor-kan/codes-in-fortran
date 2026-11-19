module m_chol_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_chol_types
    use m_chol_err
    use m_chol_ifc
    implicit none
contains
pure subroutine ldlt_solve_3x3(A, b, x)
        real(dp), intent(in) :: A(3, 3), b(3)
        real(dp), intent(out) :: x(3)
        real(dp) :: L(3, 3), D(3), y(3), z(3)
        integer :: i, j, k
        L = 0.0_dp
        do i = 1, 3
            L(i, i) = 1.0_dp
            D(i) = A(i, i)
            do k = 1, i - 1
                D(i) = D(i) - L(i, k)**2 * D(k)
            end do
            do j = i + 1, 3
                L(j, i) = A(j, i)
                do k = 1, i - 1
                    L(j, i) = L(j, i) - L(j, k) * L(i, k) * D(k)
                end do
                L(j, i) = L(j, i) / D(i)
            end do
        end do
        do i = 1, 3
            z(i) = b(i) - dot_product(L(i, 1:i-1), z(1:i-1))
            y(i) = z(i) / D(i)
        end do
        do i = 3, 1, -1
            x(i) = y(i) - dot_product(L(i+1:3, i), x(i+1:3))
        end do
    end subroutine ldlt_solve_3x3
end module m_chol_core
