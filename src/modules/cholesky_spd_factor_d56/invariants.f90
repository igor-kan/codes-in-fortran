module m_chol_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    subroutine assert_close_dp(got, expected, tol)
        real(dp), intent(in) :: got, expected, tol
        if (abs(got - expected) > tol) then
            error stop 'invariant tolerance exceeded'
        end if
    end subroutine assert_close_dp
end module m_chol_inv
