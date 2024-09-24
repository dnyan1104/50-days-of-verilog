
module dff(
 inout wire d, clk, reset,
 output reg q
    );
    
    always @(posedge clk or posedge reset)begin
    if(reset)
    q <= 0;
    else
    q <= d;
    end
    
endmodule

module shift_register(
input wire clk,
input wire reset,
input wire serial_in,
output wire [3:0]q
);



dff i1(.d(serial_in), .clk(clk), .reset(reset), .q(q[0]));
dff i2(.d(q[0]), .clk(clk), .reset(reset), .q(q[1]));
dff i3(.d(q[1]), .clk(clk), .reset(reset), .q(q[2]));
dff i4(.d(q[2]), .clk(clk), .reset(reset), .q(q[3]));
endmodule
