`timescale 1ns / 1ps


module seq_detector(
input wire clk,
input wire reset,
input wire seq_in,
output reg seq_detected
    );
    
    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b010,
              s3 = 3'b011;
              
              reg [2:0] next_state, current_state;
              
              always @(posedge clk or posedge reset)begin
              if(reset)
              current_state = s0;
              else
              current_state <= next_state;
              end
              
              always @(*)begin
              next_state = current_state;
              seq_detected = 0;
              
              case (current_state)
              s0 : if(seq_in) next_state = s1; else next_state = s0;
              s1 : if(!seq_in) next_state = s2; else next_state = s1;
              s2 : if(seq_in) next_state = s3; else next_state = s0;
              s3 : begin
              if(seq_in)begin
              seq_detected = 1;
               next_state = s0; end
              else next_state = s2;
              end
              endcase
              end
     
endmodule
