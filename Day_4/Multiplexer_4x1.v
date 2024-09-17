module mux_4x1 (
    input wire [3:0] i,
    input wire [1:0] sel,
    output wire y
);

  assign y = (sel == 2'b00) ? i[0] :
             (sel == 2'b01) ? i[1] :
             (sel == 2'b10) ? i[2] :
             i[3];

endmodule
