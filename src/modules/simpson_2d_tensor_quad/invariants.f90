module m_s2d_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    subroutine verify_cubature(got, exact, tol)
        real(dp), intent(in) :: got, exact, tol
        if (abs(got - exact) > tol) error stop '2D Simpson error above tolerance'
    end subroutine verify_cubature
end module m_s2d_inv
