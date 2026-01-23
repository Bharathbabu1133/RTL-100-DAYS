`timescale 1ns/1ps

module tb_dff_8_sync_reset_neg;

reg clk;
reg rst;
reg [7:0] d;
wire [7:0] q;

dff_8_sync_reset_neg dut(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    d = 8'h00;
    #12 rst = 0;
    #10 d = 8'hAA;
    #10 d = 8'h55;
    #10 rst = 1;
    #10 rst = 0;
    #10 d = 8'hFF;
    #20 $finish;
end

initial begin
    $monitor("time=%0t clk=%b rst=%b d=%h q=%h",
              $time, clk, rst, d, q);
end

endmodule
