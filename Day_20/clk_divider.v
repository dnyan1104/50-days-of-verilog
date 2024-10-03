module clock_divider (
    input wire clk_in,   
    output reg clk_out   
);
    
    always @(posedge clk_in) begin
        clk_out <= ~clk_out;
    end

endmodule
