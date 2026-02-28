`timescale 1ns/1ps

module counter4_tb;

reg clk;
reg reset;
wire [3:0] count;

counter4 uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10;
    reset = 0;
    #200;
    reset = 1;
    #10;
    reset = 0;
    #100;
    $finish;
end

initial begin
    $monitor("Time=%0t reset=%b count=%b", $time, reset, count);
end

endmodule