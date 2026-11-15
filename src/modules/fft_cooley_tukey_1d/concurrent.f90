module m_fft_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine batch_twiddle_scale(n, batches, gain, data_mat)
        integer, intent(in) :: n, batches
        real(dp), intent(in) :: gain
        complex(dp), intent(inout) :: data_mat(n, batches)
        integer :: i, b
        do concurrent (b = 1:batches, i = 1:n)
            data_mat(i, b) = data_mat(i, b) * gain
        end do
    end subroutine batch_twiddle_scale
end module m_fft_conc
