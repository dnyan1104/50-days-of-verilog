module tb_JK_ff;

  reg j;
  reg k;
  reg clk;
  reg reset;
  wire q;

  JK_ff uut (
    .j(j),
    .k(k),
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
    j = 0;
    k = 0;
    #10;

    reset = 0;
    j = 0; k = 0;
    #10;

    j = 1; k = 0;
    #10;

    j = 0; k = 1;
    #10;

    j = 1; k = 1;
    #10;

    $stop;
  end
endmodule
