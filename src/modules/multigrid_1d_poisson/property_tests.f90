program test_mg_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_mg_core
    use m_mg_fast
    use m_mg_conc
    implicit none
    integer, parameter :: n = 128
    real(dp), parameter :: pi = acos(-1.0_dp)
    real(dp) :: u(0:n), f(0:n), h, prev_r, cur_r
    integer :: cyc
    h = 1.0_dp / real(n, dp)
    u = 0.0_dp
    call compute_manufactured_rhs(n, h, pi, f)
    prev_r = residual_l2_1d(n, h, u, f)
    do cyc = 1, 8
        call vcycle_1d(n, h, u, f)
        cur_r = residual_l2_1d(n, h, u, f)
        if (cur_r >= prev_r) stop 1
        prev_r = cur_r
    end do
end program test_mg_prop
