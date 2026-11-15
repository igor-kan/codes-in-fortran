module m_gqr_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine batch_project_q(m, k_vecs, q, vecs, out_proj)
        integer, intent(in) :: m, k_vecs
        real(dp), intent(in) :: q(m, m), vecs(m, k_vecs)
        real(dp), intent(out) :: out_proj(m, k_vecs)
        integer :: col, i, j
        real(dp) :: s
        do concurrent (col = 1:k_vecs)
            do i = 1, m
                s = 0.0_dp
                do j = 1, m
                    s = s + q(j, i) * vecs(j, col)
                end do
                out_proj(i, col) = s
            end do
        end do
    end subroutine batch_project_q
end module m_gqr_conc
