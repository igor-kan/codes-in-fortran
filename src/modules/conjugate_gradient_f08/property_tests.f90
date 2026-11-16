program test_cgf_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_cgf_types
    use m_cgf_err
    use m_cgf_core
    use m_cgf_conc
    implicit none
    integer, parameter :: n = 8, k = 3
    real(dp) :: a(n, n), xm(n, k), bm(n, k), norms(k)
    type(cg_config_t) :: cfg
    type(cg_report_t) :: rep
    integer :: i, c
    a = 0.0_dp
    do i = 1, n
        a(i, i) = 6.0_dp
        if (i > 1) a(i, i - 1) = -1.2_dp
        if (i < n) a(i, i + 1) = -1.2_dp
    end do
    do c = 1, k
        do i = 1, n
            bm(i, c) = sin(real(i * c, dp))
            xm(i, c) = 0.0_dp
        end do
        call pcg_dense_solve(n, a, bm(:, c), xm(:, c), cfg, rep)
        if (rep%status /= ERR_OK) stop 1
    end do
    call batch_res_norms(n, k, a, xm, bm, norms)
    if (maxval(norms) > 1.0e-9_dp) stop 2
end program test_cgf_prop
