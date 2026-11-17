program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ch_types
    use m_ch_fast
    use m_ch_core
    use m_ch_inv
    implicit none
    integer, parameter :: n = 6
    real(dp) :: xs(0:n), ys(0:n)
    type(cheb_series_t) :: ser
    integer :: st
    call cheb_nodes(n, xs)
    ys = xs**4 - 2.0_dp * xs**2 + 1.0_dp
    call fit_chebyshev_nodes(n, ys, ser, st)
    if (st /= 0) error stop 'fit fail'
    call verify_exact_on_grid(ser, n, xs, ys)
    if (abs(eval_clenshaw(ser, 0.3_dp) - (0.3_dp**4 - 2.0_dp*0.09_dp + 1.0_dp)) > 1.0e-12_dp) error stop 'eval mismatch'
end program test_unit
