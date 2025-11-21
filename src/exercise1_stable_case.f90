module exercise1
   implicit none

contains
   subroutine stable_case
      real, parameter :: r = 2.8
      real :: x
      integer :: i

      character(len=20) :: filename
      integer :: iostat_val, unit
      character(len=100) :: iostat_msg

      filename = 'data.csv'
      open (newunit=unit, file=filename, status='replace', action='write', iostat=iostat_val, iomsg=iostat_msg)
      if (iostat_val /= 0) then
         print *, 'Error opening file', iostat_msg, ",", iostat_val
         return
       else 
         write (unit, '(A,",",A)') "n", "x"
      end if
      x = 0.3
      do i = 1, 100
         x = r*x*(1 - x)
         write (unit, '(G0.5,",",G0.5)') i, x
      end do

      close (unit)
   end subroutine stable_case
end module
