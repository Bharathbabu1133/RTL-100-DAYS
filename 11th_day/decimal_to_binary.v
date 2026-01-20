`timescale 1ns/1ps
module decimal_to_binary(
    input [3:0] dec,
    output reg [3:0] bin
);

integer temp;
integer i;

always @(*) begin
    temp = dec;
    bin = 4'b0000;
    i = 0;
    while (temp > 0) begin
        bin[i] = temp % 2;
        temp = temp / 2;
        i = i + 1;
    end
end

endmodule
