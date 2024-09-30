`timescale 1ns / 1ps
module display_driver(
input [3:0]bin,
output reg [6:0]seg
);
always @ (*)begin
case (bin)
            4'b0000: seg = 7'b0111111;
            4'b0001: seg = 7'b0000110; 
            4'b0010: seg = 7'b1011011; 
            4'b0011: seg = 7'b1001111; 
            4'b0100: seg = 7'b1100110; 
            4'b0101: seg = 7'b1101101; 
            4'b0110: seg = 7'b1111101; 
            4'b0111: seg = 7'b0000111; 
            4'b1000: seg = 7'b1111111; 
            4'b1001: seg = 7'b1101111; 
            default: seg = 7'b0000000; 
endcase
end
endmodule
