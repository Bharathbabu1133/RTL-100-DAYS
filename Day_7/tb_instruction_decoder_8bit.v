`timescale 1ns / 1ps

module tb_instruction_decoder_8bit;

    reg clk;
    reg rst;
    reg [7:0] instruction;
    integer i;

    instruction_decoder_8bit dut (
        .clk(clk),
        .rst(rst),
        .instruction(instruction)
    );

    always #5 clk = ~clk;

    function [15*8:1] reg_name;
        input [1:0] sel;
        begin
            case (sel)
                2'b00: reg_name = "R0";
                2'b01: reg_name = "R1";
                2'b10: reg_name = "R2";
                2'b11: reg_name = "R3";
            endcase
        end
    endfunction

    initial begin
        clk = 0;
        rst = 1;
        instruction = 8'd0;
        #10 rst = 0;

        dut.R0 = 8'd10;
        dut.R1 = 8'd5;
        dut.R2 = 8'd3;
        dut.R3 = 8'd2;

        $monitor("T=%0t OPCODE=%h SRC=%s DST=%s | R0=%d R1=%d R2=%d R3=%d",
                 $time,
                 instruction[7:4],
                 reg_name(instruction[3:2]),
                 reg_name(instruction[1:0]),
                 dut.R0, dut.R1, dut.R2, dut.R3);

        for (i = 0; i < 8; i = i + 1) begin
            case (i)
                0: instruction = 8'b0000_01_00;
                1: instruction = 8'b0001_10_01;
                2: instruction = 8'b0010_11_00;
                3: instruction = 8'b0011_00_10;
                4: instruction = 8'b1010_01_11;
                5: instruction = 8'b1011_00_10;
                6: instruction = 8'b1000_00_00;
                7: instruction = 8'b1101_00_00;
            endcase
            #10;
        end

        $finish;
    end

endmodule
