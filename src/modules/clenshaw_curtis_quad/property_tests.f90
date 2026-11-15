program test_ccq_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ccq_core
    use m_ccq_conc
    use m_ccq_fast
    implicit none
    integer, parameter :: n = 24
    real(dp) :: nodes(0:n), weights(0:n), fvals(0:n), res, exact
    integer :: st

    call clenshaw_curtis_rule(n, 0.0_dp, 2.0_dp, nodes, weights, st)
    if (st /= 0) stop 1
    call sample_nodes_concurrent(n, nodes, exp_fn, fvals)
    res = dot_quad(n, fvals, weights)
    exact = exp(2.0_dp) - 1.0_dp
    if (abs(res - exact) > 1.0e-13_dp) stop 2
contains
    pure function exp_fn(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = exp(x)
    end function exp_fn
end program test_ccq_prop
