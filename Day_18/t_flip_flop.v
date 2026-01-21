`timescale 1ns/1ps

module t_flip_flop(
    input t,
    input clk,
    input rst,
    output reg q,
    output qbar
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else if (t)
        q <= ~q;
    else
        q <= q;
end

assign qbar = ~q;

endmodule
