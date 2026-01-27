`timescale 1ns/1ps
module seq_circuit(
    input clk,
    input L,
    input r0,
    input r1,
    input r2,
    output Q0,
    output Q1,
    output Q2
);
    wire x;

    assign x = Q1 ^ Q2;

    top_module u0(clk, L, Q2, r0, Q0);
    top_module u1(clk, L, Q0, r1, Q1);
    top_module u2(clk, L, x,  r2, Q2);
endmodule
