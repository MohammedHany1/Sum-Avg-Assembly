.section .data        
input1: .asciz "%d" 
output1: .asciz "The sum is: %lf\n"   
input2: .asciz "%lf"   
output2: .asciz "The Average is: %lf\n"
n_Number: .int 0            
sum: .double 0.0    
number: .double 0.0
Average: .double 0.0

.section .text  
      
.globl _main   
       
_main:            
    
  pushl $n_Number           
  pushl $input1      
  call _scanf       
  add $8, %esp      


  movl $0, %ecx    

loop1:

  pushl %ecx

  pushl $number 
  pushl $input2
  call _scanf
  add $8, %esp

  popl %ecx    

  fldl number
  faddl sum
  fstpl sum 
  add $1, %ecx                  
  cmpl %ecx, n_Number
  ja loop1 

  fildl n_Number
  fldl sum
  fdivp %st(0), %st(1)
  fstpl Average 
       
  pushl sum+4
  pushl sum  
  pushl $output1      
  call _printf       
  add $12, %esp

  pushl Average+4
  pushl Average  
  pushl $output2     
  call _printf       
  add $12, %esp      

  ret