module adder_4bit (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [4:0] sum
);

    function [4:0] add4bit;
        input [3:0] x, y;
        input c_in;
        begin
            add4bit = x + y + c_in;
        end
    endfunction

    assign sum = add4bit(a, b, cin);

endmodule
