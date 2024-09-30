module tb_display_driver;
reg [3:0]bin;
wire [6:0]seg;
display_driver uut(
.bin(bin),
.seg(seg)
);

initial begin
bin = 4'b0000;#10;
bin = 4'b0001;#10;
bin = 4'b0010;#10;
bin = 4'b0011;#10;
bin = 4'b0100;#10;
bin = 4'b0101;#10;
bin = 4'b0110;#10;
bin = 4'b0111;#10;
bin = 4'b1000;#10;
bin = 4'b1001;#10;
bin = 4'b1010;#10;
$stop;
end


endmodule
