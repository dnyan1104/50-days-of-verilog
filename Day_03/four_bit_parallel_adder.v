module full_adder(
    input wire a,        
    input wire b,        
    input wire cin,     
    output wire sum,    
    output wire cout     
);

  // Full adder logic
  assign sum = a ^ b ^ cin;     
  assign cout = (a & b) | (b & cin) | (a & cin);  

endmodule

module four_bit_parallel_adder(
    input wire [3:0] A,     
    input wire [3:0] B,      
    input wire cin,          
    output wire [3:0] sum,  
    output wire cout         
);

  wire c1, c2, c3;           

  // Instantiate 4 full adders for each bit
  full_adder fa0 (A[0], B[0], cin, sum[0], c1);  
  full_adder fa1 (A[1], B[1], c1, sum[1], c2);   
  full_adder fa2 (A[2], B[2], c2, sum[2], c3);  
  full_adder fa3 (A[3], B[3], c3, sum[3], cout); 
endmodule
