module tb_d_ff;
 reg d;
 reg clk;
 wire q;
 
 d_ff uut(
   .d(d),
   .clk(clk),
   .q(q)
   );
   
   initial begin
   clk =0;
   forever #5 clk = ~clk;
   end
   
   initial begin
   d=0;
   #10;
   
   d=1;
   #10;
   
   d=0;
   #10;
   
   d=1;
   #10;
   
   d=0;
   #10;
   
   $stop;
   end
   
endmodule
