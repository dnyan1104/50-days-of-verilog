module tb_shift_register;
reg serial_in;
reg clk;
reg reset;
wire [3:0]q;

shift_register uut(
.serial_in(serial_in),
.clk(clk),
.reset(reset),
.q(q)
);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
reset = 1;
serial_in =0;
#10;

reset =0;
serial_in = 1; #10;
serial_in = 0; #10;
serial_in = 1; #10;
serial_in = 1; #10;
serial_in = 0; #10;
serial_in = 1; #10;
serial_in = 0; #10;
serial_in = 1; #10;
$stop;
end
endmodule
