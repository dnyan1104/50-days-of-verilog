`timescale 1ns / 1ps



module basic_counter(
    input wire clk, wire reset,
    output reg [3:0]count
    );
    
    always @(posedge clk or posedge reset) begin
    if(reset)
    count <=0;
    else 
    count <= count +1;
    end
    
endmodule
