`timescale 1ns/1ps
module tb_top_module;
    reg clk;
    reg E;
    reg L;
    reg w;
    reg Rin;
    reg Lin;
    wire Q;

    top_module dut(clk, E, L, w, Rin, Lin, Q);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        E = 0;
        L = 0;
        w = 0;
        Rin = 0;
        Lin = 0;
        #10;

        E = 1;
        w = 1;
        #10;

        w = 0;
        #10;

        L = 1;
        Lin = 1;
        #10;

        Lin = 0;
        #10;

        L = 0;
        E = 0;
        #20;

        $finish;
    end
endmodule
