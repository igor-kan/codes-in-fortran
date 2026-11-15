program bench_jacobi
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_jcb_types
    use m_jcb_core
    implicit none
    integer, parameter :: n = 24
    real(dp) :: a(n, n), evals(n), evecs(n, n)
    type(eigen_config_t) :: cfg
    type(eigen_report_t) :: rep
    integer(int64) :: t0, t1, rate
    integer :: i, j

    do j = 1, n
        do i = 1, n
            a(i, j) = cos(0.3_dp * real(i + j, dp))
        end do
        a(j, j) = real(n, dp)
    end do
    call system_clock(t0, rate)
    call jacobi_eigen_solve(n, a, evals, evecs, cfg, rep)
    call system_clock(t1)
    if (evals(1) == -9999.0_dp .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_jacobi
