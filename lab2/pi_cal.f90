program pi_cal
  use omp_lib
  implicit none
  integer :: i, niter
  real(8) :: pi, start, end

  ! Initialize variables
  pi = 0.0d0
  niter = 1000000000

  ! Timing
  start = omp_get_wtime()

  ! Calculate part of Leibnitz sum in parallel
  !$omp parallel do reduction(+:pi)
  do i = 0, niter-1
     pi = pi + real((-1)**i, 8) * (4.0d0 / (2.0d0*real(i, 8)+1.0d0))
  end do
  !$omp end parallel do

  ! Stop timing
  end = omp_get_wtime()

  ! Print result
  write(*, '(a, f0.10, a, f6.3, a)', advance='no') "pi estimate is ", pi, ", obtained in ", end-start, " seconds in Fortran"
  write(*, *)
end program pi_cal

