`timescale 1ns / 1ps

module sr_latch_tb;

    reg S;
    reg R;
    wire Q;
    wire Qn;

    sr_latch uut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        $monitor("Time: %0t | S: %b | R: %b | Q: %b | Qn: %b", $time, S, R, Q, Qn);
        
        S = 0;
        R = 0;
        
        #10 S = 1; R = 0;
        #10 S = 0; R = 0;
        
        #10 S = 0; R = 1;
        #10 S = 0; R = 0;

        #10 S = 1; R = 1;
        
        #10 $stop;
    end

endmodule
