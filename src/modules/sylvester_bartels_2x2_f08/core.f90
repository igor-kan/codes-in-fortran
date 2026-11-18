module m_syl_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_syl_types
    use m_syl_err
    use m_syl_ifc
    implicit none
contains
pure subroutine solve_diagonal_sylvester_2x2(a_diag, b_diag, C, X)
        real(dp), intent(in) :: a_diag(2), b_diag(2), C(2, 2)
        real(dp), intent(out) :: X(2, 2)
        integer :: i, j
        do j = 1, 2
            do i = 1, 2
                X(i, j) = C(i, j) / (a_diag(i) + b_diag(j))
            end do
        end do
    end subroutine solve_diagonal_sylvester_2x2
end module m_syl_core
