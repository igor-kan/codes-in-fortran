module m_sec_test_fns
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function f_cubic(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = x**3 - x - 2.0_dp
    end function f_cubic
end module m_sec_test_fns
program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sec_types
    use m_sec_core
    use m_sec_inv
    use m_sec_test_fns
    implicit none
    type(root_res_t) :: r
    call solve_secant(f_cubic, 1.0_dp, 2.0_dp, 1.0e-12_dp, 100, r)
    call verify_root(r)
    if (abs(r%x - 1.5213797068045676_dp) > 1.0e-10_dp) error stop 'cubic root wrong'
end program test_unit
