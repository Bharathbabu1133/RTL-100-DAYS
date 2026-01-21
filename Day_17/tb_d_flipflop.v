`timescale 1ns/1ps

module tb_d_flipflop;

reg d;
reg clk;
wire q;
wire qbar;

d_flipflop dut(
    .d(d),
    .clk(clk),
    .q(q),
    .qbar(qbar)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    d = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 1;
    #10 d = 0;
    #10 $finish;
end

initial begin
    $monitor("time=%0t d=%b q=%b qbar=%b", $time, d, q, qbar);
end

endmodule
