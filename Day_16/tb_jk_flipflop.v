`timescale 1ns/1ps
module tb_jk_flipflop;

reg j;
reg k;
reg clk;
wire q;
wire qbar;

jk_flipflop dut(
    .j(j),
    .k(k),
    .clk(clk),
    .q(q),
    .qbar(qbar)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    j = 0; k = 0;
    #10 j = 0; k = 1;
    #10 j = 1; k = 0;
    #10 j = 1; k = 1;
    #10 j = 0; k = 0;
    #20 $finish;
end

initial begin
    $monitor("time=%0t j=%b k=%b q=%b qbar=%b", $time, j, k, q, qbar);
end

endmodule
