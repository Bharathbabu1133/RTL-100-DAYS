`timescale 1ns/1ps

module freq_divider_tb;

reg clk;
reg reset;

wire OneHertz;
wire [2:0] c_enable;

freq_divider_1000_to_1 uut (
    .clk(clk),
    .reset(reset),
    .OneHertz(OneHertz),
    .c_enable(c_enable)
);

initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin
    reset = 1;
    #5;
    reset = 0;
    #2500;
    $finish;
end

initial begin
    $monitor("Time=%0t OneHertz=%b c_enable=%b",
              $time, OneHertz, c_enable);
end

endmodule