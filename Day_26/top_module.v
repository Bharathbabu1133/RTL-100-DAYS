`timescale 1ns/1ps
module top_module(
    input clk,
    input L,
    input d0,
    input d1,
    output reg q
);
    wire d;

    assign d = L ? d1 : d0;

    always @(posedge clk)
        q <= d;
endmodule
