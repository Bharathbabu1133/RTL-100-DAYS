`timescale 1ns/1ps
module top_module(
    input clk,
    input E,
    input L,
    input w,
    input Rin,
    input Lin,
    output reg Q
);
    wire m1;
    wire m2;

    assign m1 = E ? w : Q;
    assign m2 = L ? Lin : Rin;

    always @(posedge clk)
        Q <= L ? m2 : m1;
endmodule
