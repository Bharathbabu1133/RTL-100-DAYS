`timescale 1ns/1ps
module tb_xor_feedback_dff;

reg in;
reg clk;
reg rst;
wire out;

xor_feedback_dff dut(
    .in(in),
    .clk(clk),
    .rst(rst),
    .out(out)
);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    rst = 1;
    in = 0;
    #12 rst = 0;

    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;

    #50 $finish;
end

endmodule
