`timescale 1ns/1ps
module xor_feedback_dff(
    input in,
    input clk,
    input rst,
    output reg out
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        out <= 0;
    else
        out <= in ^ out;
end

endmodule
