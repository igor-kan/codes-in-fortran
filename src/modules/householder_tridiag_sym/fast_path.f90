module m_htd_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function tridiag_trace(n, d) result(tr)
        integer, intent(in) :: n
        real(dp), intent(in) :: d(n)
        real(dp) :: tr
        tr = sum(d)
    end function tridiag_trace
end module m_htd_fast
