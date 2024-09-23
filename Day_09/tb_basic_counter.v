module tb_counter;

reg clk;
reg reset;
wire [3:0]count;

basic_counter uut(
.clk(clk),
.reset(reset),
.count(count)
);

initial begin
forever #5 clk =~clk;
end

initial begin

reset =1; #10;
reset = 0; #100;
$stop;

 
end
endmodule
