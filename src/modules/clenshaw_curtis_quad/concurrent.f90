module m_ccq_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ccq_ifc
    implicit none
contains
    pure subroutine sample_nodes_concurrent(n, nodes, fn, fvals)
        integer, intent(in) :: n
        real(dp), intent(in) :: nodes(0:n)
        procedure(integrand_iface) :: fn
        real(dp), intent(out) :: fvals(0:n)
        integer :: k
        do concurrent (k = 0:n)
            fvals(k) = fn(nodes(k))
        end do
    end subroutine sample_nodes_concurrent
end module m_ccq_conc
