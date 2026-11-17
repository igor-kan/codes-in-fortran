program bench_householder_tridiag_sym
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_htd_types
    use m_htd_core
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    real(dp) :: a(5,5), d(5), e(4); integer :: j
    type(tridiag_rep_t) :: rep
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        a = 0.1_dp; do j=1,5; a(j,j)=5.0_dp; end do
        call tridiag_householder(5,a,d,e,rep); sink=sink+d(1)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'householder_tridiag_sym ms=', (t1 - t0) * 20.0_dp, &
        ' sink=', sink
end program bench_householder_tridiag_sym
