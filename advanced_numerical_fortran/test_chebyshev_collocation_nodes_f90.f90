program test_chebyshev_collocation_nodes_f90
    use chebyshev_collocation_nodes_f90_mod, only: cheb_node
    implicit none
    if (abs(cheb_node(0, 4) - 1.0) > 1.0e-7) stop 1
    write(*,*) "test_chebyshev_collocation_nodes_f90 passed."
end program test_chebyshev_collocation_nodes_f90
