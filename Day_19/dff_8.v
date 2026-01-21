`timescale 1ns/1ps

module dff_8(
    input clk,
    input [7:0] d,
    output reg [7:0] q
);

always @(posedge clk) begin
    q <= d;
end

endmodule
