`timescale 1ns/1ps

module tb_dff_8_async_reset;

reg clk;
reg rst;
reg [7:0] d;
wire [7:0] q;

dff_8_async_reset dut(
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
    #7 rst = 0;
    #10 d = 8'h12;
    #10 d = 8'hA5;
    #8 rst = 1;
    #5 rst = 0;
    #10 d = 8'hFF;
    #20 $finish;
end

initial begin
    $monitor("time=%0t rst=%b d=%h q=%h", $time, rst, d, q);
end

endmodule
