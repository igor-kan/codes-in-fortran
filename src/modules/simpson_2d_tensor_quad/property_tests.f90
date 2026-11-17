module m_s2d_prop_fns
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function trig2d(x, y) result(v)
        real(dp), intent(in) :: x, y
        real(dp) :: v
        v = sin(x) * cos(y)
    end function trig2d
end module m_s2d_prop_fns
program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_s2d_types
    use m_s2d_conc
    use m_s2d_prop_fns
    implicit none
    real(dp) :: vc, vf, exact
    exact = (1.0_dp - cos(1.0_dp)) * sin(1.0_dp)
    call refine_pair(box2d_t(0.0_dp, 1.0_dp, 0.0_dp, 1.0_dp, 4, 4), trig2d, vc, vf)
    if (abs(vf - exact) >= abs(vc - exact)) error stop 'Simpson refinement did not converge faster'
end program test_props
