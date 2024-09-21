module tb_T_ff;

  reg t;
  reg clk;
  reg reset;
  wire q;

  T_ff uut (
    .t(t),
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    reset = 1;
    t = 0;
    #10;
    reset = 0;
    t = 0;
    #10;
    t = 1;
    #10;
    t = 0;
    #10;
    t = 1;
    #10;
    $stop;
  end
endmodule
