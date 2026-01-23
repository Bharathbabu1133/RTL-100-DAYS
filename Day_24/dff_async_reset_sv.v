`timescale 1ns/1ps
module tb_dff_async_reset;

reg d;
reg clk;
reg ar;
wire q;

dff_async_reset dut(
    .d(d),
    .clk(clk),
    .ar(ar),
    .q(q)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    d = 0;
    ar = 1;

    #10 ar = 0;
    #10 d = 1;
    #10 d = 0;
    #10 ar = 1;
    #10 ar = 0;
    #10 d = 1;
    #20 $finish;
end

endmodule
