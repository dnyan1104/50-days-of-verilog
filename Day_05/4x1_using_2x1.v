module mux_2x1 (
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);

  assign y = (sel) ? b : a;

endmodule

module mux_4x1 (
    input wire [3:0] i,
    input wire [1:0] sel,
    output wire y
);

  wire m0_out, m1_out;

  mux_2x1 m0 (
    .a(i[0]),
    .b(i[1]),
    .sel(sel[0]),
    .y(m0_out)
  );

  mux_2x1 m1 (
    .a(i[2]),
    .b(i[3]),
    .sel(sel[0]),
    .y(m1_out)
  );

  mux_2x1 m2 (
    .a(m0_out),
    .b(m1_out),
    .sel(sel[1]),
    .y(y)
  );

endmodule
