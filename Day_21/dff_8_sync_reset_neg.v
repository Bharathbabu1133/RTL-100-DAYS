`timescale 1ns/1ps

module dff_8_sync_reset_neg(
    input clk,
    input rst,
    input [7:0] d,
    output reg [7:0] q
);

always @(negedge clk) begin
    if (rst)
        q <= 8'h34;
    else
        q <= d;
end

endmodule
