module m_sec_inv
    use m_sec_types
    implicit none
contains
    subroutine verify_root(r)
        type(root_res_t), intent(in) :: r
        if (r%status /= 0 .or. abs(r%fx) > 1.0e-10_dp) error stop 'secant residual error'
    end subroutine verify_root
end module m_sec_inv
