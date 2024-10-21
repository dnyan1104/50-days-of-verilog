module tb_siso_shift_register;

    reg clk;
    reg rst;
    reg serial_in;
    wire serial_out;

    siso_shift_register uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock with 10 time units period
    end

    initial begin
        rst = 1;
        serial_in = 0;
        #10 rst = 0; // Deassert reset after 10 time units
        
        // Shift in 8 bits: 11010011
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Shift in additional bits and observe output
        serial_in = 0; #10;
        serial_in = 1; #10;

        $stop;
    end

endmodule
