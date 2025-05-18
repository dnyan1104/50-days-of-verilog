module tone_generator (
    input clk,
    input [2:0] note_sel,
    output reg buzzer
);

parameter C = 100;
parameter D = 200;
parameter E = 300;
parameter F = 400;
parameter G = 500;
parameter A = 600;
parameter B = 700;

reg [31:0] counter = 0;
reg [31:0] threshold;

initial buzzer = 0;

always @(posedge clk) begin
    case (note_sel)
        3'b000: threshold <= C;
        3'b001: threshold <= D;
        3'b010: threshold <= E;
        3'b011: threshold <= F;
        3'b100: threshold <= G;
        3'b101: threshold <= A;
        3'b110: threshold <= B;
        default: threshold <= 0; // Mute
    endcase

    if (threshold != 0) begin
        if (counter >= threshold) begin
            counter <= 0;
            buzzer <= ~buzzer;
        end else begin
            counter <= counter + 1;
        end
    end else begin
        buzzer <= 0;
        counter <= 0;
    end
end

endmodule
