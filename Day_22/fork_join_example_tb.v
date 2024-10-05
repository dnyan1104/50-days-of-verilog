`timescale 1ns / 1ps

module counter_fork_join_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    
    counter_fork_join uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

   
    initial begin
        reset = 1; 
        #10 reset = 0; 
        #100 reset = 1;  
        #10 reset = 0;  

        #200 $stop; 
    end

   
    initial begin
        $monitor("Time: %0t | Reset: %b | Count: %b", $time, reset, count);
    end

endmodule
