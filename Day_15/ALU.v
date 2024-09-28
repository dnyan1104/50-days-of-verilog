module eight_bit_ALU(
    input [7:0] A, B,
    input [2:0] sel,
    output reg [7:0] y,
    output reg carry
    );

    always @(*) begin
        case (sel)
            3'b000: {carry, y} = A + B;
            3'b001: {carry, y} = A - B;
            3'b010: begin
                y = A * B;
                carry = 0;
            end
            3'b011: begin
                if (B != 0)
                    y = A / B;
                else
                    y = 8'b0;
                carry = 0;
            end
            3'b100: begin
                y = A & B;
                carry = 0;
            end
            3'b101: begin
                y = A | B;
                carry = 0;
            end
            3'b110: begin
                y = A ^ B;
                carry = 0;
            end
            3'b111: begin
                y = ~A;
                carry = 0;
            end
            default: begin
                y = 8'b0;
                carry = 0;
            end
        endcase
    end
endmodule
