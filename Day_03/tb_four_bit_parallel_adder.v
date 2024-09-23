module tb_four_bit_parallel_adder;

  reg [3:0] A;
  reg [3:0] B;
  reg cin;

  wire [3:0] sum;
  wire cout;

  four_bit_parallel_adder uut (
    .A(A),
    .B(B),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    
    A = 4'b0001; B = 4'b0010; cin = 0;
    #10;
    
   
    A = 4'b1010; B = 4'b0101; cin = 0;
    #10;

    
    A = 4'b1111; B = 4'b1111; cin = 0;
    #10;

   
    A = 4'b1001; B = 4'b1001; cin = 1;
    #10;

    
    A = 4'b0110; B = 4'b0011; cin = 1;
    #10;
    
    $stop;
  end
endmodule
