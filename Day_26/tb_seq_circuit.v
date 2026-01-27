`timescale 1ns/1ps
module tb_seq_circuit;
    reg clk;
    reg L;
    reg r0;
    reg r1;
    reg r2;
    wire Q0;
    wire Q1;
    wire Q2;

    seq_circuit dut(clk, L, r0, r1, r2, Q0, Q1, Q2);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        L = 1;
        r0 = 0;
        r1 = 1;
        r2 = 1;
        #10;

        L = 0;
        #40;

        L = 1;
        r0 = 1;
        r1 = 0;
        r2 = 1;
        #10;

        L = 0;
        #50;

        $finish;
    end
endmodule
