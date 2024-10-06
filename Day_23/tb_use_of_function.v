module testbench;
    reg [3:0] a, b;
    reg cin;
    wire [4:0] sum;

    adder_4bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum)
    );

    initial begin
        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #10;
        a = 4'b0101; b = 4'b0011; cin = 1'b0;
        #10;
        a = 4'b1010; b = 4'b0111; cin = 1'b1;
        #10;
        a = 4'b1111; b = 4'b1111; cin = 1'b1;
        #10;
        a = 4'b0011; b = 4'b0001; cin = 1'b0;
        #10;
        a = 4'b0110; b = 4'b0010; cin = 1'b1;
        #10;
        $stop;
    end

    initial begin
        $monitor("Time = %0t | a = %b | b = %b | cin = %b | sum = %b", $time, a, b, cin, sum);
    end
endmodule
