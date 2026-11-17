module m_s2d_test_fns
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function poly2d(x, y) result(v)
        real(dp), intent(in) :: x, y
        real(dp) :: v
        v = (x**3) * (y**2) + 2.0_dp * x * y
    end function poly2d
end module m_s2d_test_fns
program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_s2d_types
    use m_s2d_core
    use m_s2d_inv
    use m_s2d_test_fns
    implicit none
    type(box2d_t) :: box
    real(dp) :: val
    integer :: st
    box = box2d_t(0.0_dp, 1.0_dp, 0.0_dp, 2.0_dp, 4, 4)
    call simpson_2d(box, poly2d, val, st)
    ! int_0^1 int_0^2 (x^3 y^2 + 2xy) dy dx = (1/4)*(8/3) + 2*(1/2)*(2) = 2/3 + 2 = 8/3
    call verify_cubature(val, 8.0_dp / 3.0_dp, 1.0e-12_dp)
end program test_unit
