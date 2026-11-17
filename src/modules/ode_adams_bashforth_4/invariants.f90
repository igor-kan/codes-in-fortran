module m_ab4_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    subroutine check_global_error(got, exact, tol)
        real(dp), intent(in) :: got, exact, tol
        if (abs(got - exact) > tol) error stop 'AB4 ODE error above bound'
    end subroutine check_global_error
end module m_ab4_inv
