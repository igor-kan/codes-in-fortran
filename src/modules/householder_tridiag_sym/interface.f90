module m_htd_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        subroutine sim_op(n, a, d, e)
            import :: dp
            integer, intent(in) :: n
            real(dp), intent(inout) :: a(n, n)
            real(dp), intent(out) :: d(n), e(n - 1)
        end subroutine sim_op
    end interface
end module m_htd_ifc
