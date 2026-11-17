program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ch_types
    use m_ch_fast
    use m_ch_core
    use m_ch_conc
    implicit none
    integer, parameter :: n = 8
    real(dp) :: xs(0:n), ys(0:n), q(3), out(3)
    type(cheb_series_t) :: ser
    integer :: st
    call cheb_nodes(n, xs)
    ys = cos(xs)
    call fit_chebyshev_nodes(n, ys, ser, st)
    q = [-0.5_dp, 0.0_dp, 0.5_dp]
    call batch_eval(ser, 3, q, out)
    if (abs(out(2) - 1.0_dp) > 1.0e-8_dp) error stop 'cosine interp error'
end program test_props
