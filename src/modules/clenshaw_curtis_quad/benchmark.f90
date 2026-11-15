program bench_ccq
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_ccq_core
    implicit none
    integer, parameter :: n = 64
    real(dp) :: nodes(0:n), weights(0:n)
    integer(int64) :: t0, t1, rate
    integer :: st, k
    real(dp) :: acc

    acc = 0.0_dp
    call system_clock(t0, rate)
    do k = 1, 200
        call clenshaw_curtis_rule(n, -1.0_dp, 1.0_dp, nodes, weights, st)
        acc = acc + sum(weights)
    end do
    call system_clock(t1)
    if (abs(acc - 400.0_dp) > 1.0e-9_dp .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_ccq
