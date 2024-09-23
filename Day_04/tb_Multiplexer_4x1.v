module tb_mux_4x1;

  reg [3:0] i;
  reg [1:0] sel;
  wire y;

  mux_4x1 uut (
    .i(i),
    .sel(sel),
    .y(y)
  );

  initial begin
    i = 4'b1010; sel = 2'b00;
    #10;

    i = 4'b1010; sel = 2'b01;
    #10;

    i = 4'b1010; sel = 2'b10;
    #10;

    i = 4'b1010; sel = 2'b11;
    #10;

    $stop;
  end
endmodule
