module tb_ALU;
    reg [7:0] A, B;
    reg [2:0] sel;
    wire [7:0] y;
    wire carry;

    eight_bit_ALU uut (
        .A(A),
        .B(B),
        .sel(sel),
        .y(y),
        .carry(carry)
    );

    initial begin
        A = 8'b00001100;
        B = 8'b00000101;
        sel = 3'b000;
        #10;

        sel = 3'b001;
        #10;

        sel = 3'b010;
        #10;

        sel = 3'b011;
        #10;

        sel = 3'b100;
        #10;

        sel = 3'b101;
        #10;

        sel = 3'b110;
        #10;

        sel = 3'b111;
        #10;

        $finish;
    end
endmodule
