`timescale 1ns / 1ps

module fork_join_example;

    reg a, b, c;
    reg [1:0] result;

    initial begin
        a = 0;
        b = 0;
        c = 0;
        result = 2'b00;

        fork
            begin
                #10 a = 1;
            end
            begin
                #15 b = 1;
            end
            begin
                #20 c = 1;
            end
        join

        result = {b, a};
        #10 $finish;
    end

endmodule
