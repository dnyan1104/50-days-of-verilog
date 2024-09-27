module tb_traffic_light_controller;

    reg clk;
    reg reset;
    wire [2:0] light_main;
    wire [2:0] light_side;

    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .light_main(light_main),
        .light_side(light_side)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10;
        reset = 0;

        #100;
        $stop;
    end
endmodule
