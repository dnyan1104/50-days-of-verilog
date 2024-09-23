module T_ff (
    input wire t,
    input wire clk,
    input wire reset,
    output reg q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
    end
endmodule
