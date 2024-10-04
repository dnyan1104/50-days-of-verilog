`timescale 1ns / 1ps

module sr_latch(
    input S,
    input R,
    output Q,
    output Qn
);

reg Q_int, Qn_int;

assign Q = Q_int;
assign Qn = Qn_int;

always @(S or R) begin
    if (S == 1 && R == 0) begin
        Q_int = 1;
        Qn_int = 0;
    end else if (S == 0 && R == 1) begin
        Q_int = 0;
        Qn_int = 1;
    end else if (S == 0 && R == 0) begin
        Q_int = Q_int;
        Qn_int = Qn_int;
    end else if (S == 1 && R == 1) begin
        Q_int = 1'bx;
        Qn_int = 1'bx;
    end
end

endmodule
