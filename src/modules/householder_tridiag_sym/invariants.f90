module m_htd_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    subroutine check_trace_conserved(diff)
        real(dp), intent(in) :: diff
        if (diff > 1.0e-10_dp) error stop 'Householder trace mismatch'
    end subroutine check_trace_conserved
end module m_htd_inv
