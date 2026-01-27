`timescale 1ns/1ps
module tb_fsm_circuit;
    reg clk;
    reg X;
    wire Z;

    fsm_circuit dut(clk, X, Z);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        X = 0;
        #10;

        X = 1;
        #20;

        X = 0;
        #20;

        X = 1;
        #30;

        X = 0;
        #20;

        $finish;
    end
endmodule
