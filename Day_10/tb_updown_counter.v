module tb_updown_counter;

reg clk;
reg reset;
reg up_down;
wire [3:0]count;

bit_updown_counter uut(
.clk(clk),
.reset(reset),
.up_down(up_down),
.count(count)
);

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
reset =1;
up_down =1;
#10;
reset =0; 
#50;
up_down= 0;
#50;
$stop;

end
endmodule
