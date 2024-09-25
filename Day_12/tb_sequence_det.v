module tb_seq_det;

    reg clk;
    reg reset;
    reg seq_in;
    wire seq_detected;

    seq_detector uut (
        .clk(clk),
        .reset(reset),
        .seq_in(seq_in),
        .seq_detected(seq_detected)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        seq_in = 0;
        #12;  
        reset = 0;

        seq_in = 1; #8;  
        seq_in = 0; #10;
        seq_in = 1; #10;
        seq_in = 1; #10;  
        seq_in = 0; #10;  
        seq_in = 1; #10;  
        seq_in = 0; #10;  
        seq_in = 1; #10;  
        seq_in = 1; #10;  

        $stop;
    end
endmodule
