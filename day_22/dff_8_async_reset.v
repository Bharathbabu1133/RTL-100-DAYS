`timescale 1ns/1ps

module dff_8_async_reset(
    input clk,
    input rst,
    input [7:0] d,
    output reg [7:0] q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 8'b00000000;
    else
        q <= d;
end

endmodule