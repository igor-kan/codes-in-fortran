module m_poweig_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_poweig_fast
    implicit none
contains
    pure subroutine batch_norms(mat, out_norms)
        real(dp), intent(in) :: mat(:, :)
        real(dp), intent(out) :: out_norms(:)
        integer :: i
        do concurrent (i = 1:size(mat, 2))
            out_norms(i) = fast_l2_sq(mat(:, i))
        end do
    end subroutine batch_norms
end module m_poweig_conc
