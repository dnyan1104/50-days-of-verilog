`timescale 1ns / 1ps

module led_matrix(
input wire  reset,
input wire  clk,
input wire [63:0]led_pattern,
output reg [7:0]row_select,
output reg [7:0]col_select
);
 reg [3:0]row_counter;

always @(posedge clk or posedge reset)begin
if(reset)
row_counter <= 3'b000;
else 
row_counter <= row_counter +1;
end

always @(*)begin
case(row_counter)
3'b000 : begin
       row_select = 8'b00000001;
       col_select = led_pattern[7:0];
       end
3'b001 : begin
       row_select = 8'b00000010;
       col_select = led_pattern[15:8];
       end        
3'b010 : begin
       row_select = 8'b00000100;
       col_select = led_pattern[23:16];
       end
3'b011 : begin
       row_select = 8'b00001000;
       col_select = led_pattern[31:24];
       end      
3'b100 : begin
       row_select = 8'b00010000;
       col_select = led_pattern[39:32];
       end
3'b101 : begin
       row_select = 8'b00100000;
       col_select = led_pattern[47:40];
       end
3'b110 : begin
       row_select = 8'b01000000;
       col_select = led_pattern[55:48];
       end 
3'b111 : begin
       row_select = 8'b10000000;
       col_select = led_pattern[63:56];
       end            
endcase
end
endmodule
