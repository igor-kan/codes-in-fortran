program test_ccq_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ccq_err
    use m_ccq_core
    use m_ccq_val
    use m_ccq_inv
    implicit none
    integer, parameter :: n = 16
    real(dp) :: nodes(0:n), weights(0:n), val, exact
    integer :: st

    if (validate_interval(n, 0.0_dp, 1.0_dp) /= ERR_OK) stop 1
    call clenshaw_curtis_rule(n, 0.0_dp, 1.0_dp, nodes, weights, st)
    if (st /= ERR_OK) stop 2
    if (check_weight_sum(n, 0.0_dp, 1.0_dp, weights) > 1.0e-14_dp) stop 3
    if (check_weight_symmetry(n, weights) > 1.0e-14_dp) stop 4
    val = integrate_cc(n, nodes, weights, poly8)
    exact = 1.0_dp / 9.0_dp + 1.0_dp
    if (abs(val - exact) > 1.0e-13_dp) stop 5
contains
    pure function poly8(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = x ** 8 + 1.0_dp
    end function poly8
end program test_ccq_unit
