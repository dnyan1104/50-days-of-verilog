module priority_encoder_8to3 (
    input [7:0] in,
    output reg [2:0] out,
    output reg valid
);

    always @(*) begin
        valid = 1'b0;
        out = 3'b000;
        casez (in)
            8'b1???????: begin valid = 1'b1; out = 3'b111; end
            8'b01??????: begin valid = 1'b1; out = 3'b110; end
            8'b001?????: begin valid = 1'b1; out = 3'b101; end
            8'b0001????: begin valid = 1'b1; out = 3'b100; end
            8'b00001???: begin valid = 1'b1; out = 3'b011; end
            8'b000001??: begin valid = 1'b1; out = 3'b010; end
            8'b0000001?: begin valid = 1'b1; out = 3'b001; end
            8'b00000001: begin valid = 1'b1; out = 3'b000; end
            default:     begin valid = 1'b0; out = 3'b000; end
        endcase
    end

endmodule
