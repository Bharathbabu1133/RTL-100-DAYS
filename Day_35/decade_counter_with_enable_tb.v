`timescale 1ns/1ps

module decade_counter_with_enable_tb;

reg clk;
reg reset;
reg slowena;
wire [3:0] count;

decade_counter_with_enable uut (
    .clk(clk),
    .reset(reset),
    .slowena(slowena),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    slowena = 0;
    #10;
    reset = 0;
    slowena = 1;
    #100;
    slowena = 0;
    #50;
    slowena = 1;
    #100;
    reset = 1;
    #10;
    reset = 0;
    slowena = 1;
    #100;
    $finish;
end

initial begin
    $monitor("Time=%0t reset=%b slowena=%b count=%d", $time, reset, slowena, count);
end

endmodule