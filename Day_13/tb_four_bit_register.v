`timescale 1ns / 1ps


module tb_four_bit_register;
reg clk;
reg reset;
reg [3:0]d;
reg enable;
wire  [3:0]q;

four_bit_register uut(
.clk(clk),
.reset(reset),
.d(d),
.enable(enable),
.q(q)
);

initial begin
clk =0;
forever #5 clk = ~clk;
end

initial begin
reset =1;
enable =0;
d = 4'b0000; #10;


reset = 0;
enable =1;
d= 4'b1010; #10;
d= 4'b1100; #10;
enable =0;
d= 4'b1111; #10;
enable =1;
d= 4'b0001; #10;
$stop;


end
endmodule
