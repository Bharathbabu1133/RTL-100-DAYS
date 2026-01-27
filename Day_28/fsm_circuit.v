`timescale 1ns/1ps
module fsm_circuit(
    input clk,
    input X,
    output Z
);
    reg Q2;
    reg Q1;
    reg Q0;

    wire D2;
    wire D1;
    wire D0;

    assign D2 = X ^ Q2;
    assign D1 = X & ~Q1;
    assign D0 = X | ~Q0;

    always @(posedge clk) begin
        Q2 <= D2;
        Q1 <= D1;
        Q0 <= D0;
    end

    assign Z = ~(Q2 | Q1 | Q0);
endmodule
