`timescale 1ns/1ps

module decade_counter_tb;

reg clk;
reg reset;
wire [3:0] count;

decade_counter uut (
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
    #150;
    reset = 1;
    #10;
    reset = 0;
    #100;
    $finish;
end

initial begin
    $monitor("Time=%0t reset=%b count=%d", $time, reset, count);
end

endmodule