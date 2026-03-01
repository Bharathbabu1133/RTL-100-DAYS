`timescale 1ns/1ps

module counter_1_to_12_tb;

reg Clk;
reg Reset;
reg Enable;

wire [3:0] Q;
wire c_enable;
wire c_load;
wire [3:0] c_d;

counter_1_to_12 uut (
    .Clk(Clk),
    .Reset(Reset),
    .Enable(Enable),
    .Q(Q),
    .c_enable(c_enable),
    .c_load(c_load),
    .c_d(c_d)
);

initial begin
    Clk = 0;
    forever #5 Clk = ~Clk;
end

initial begin
    Reset = 1;
    Enable = 0;
    #10;
    Reset = 0;
    Enable = 1;
    #200;
    Enable = 0;
    #40;
    Enable = 1;
    #100;
    Reset = 1;
    #10;
    Reset = 0;
    Enable = 1;
    #100;
    $finish;
end

initial begin
    $monitor("Time=%0t Reset=%b Enable=%b Q=%d c_enable=%b c_load=%b c_d=%d",
              $time, Reset, Enable, Q, c_enable, c_load, c_d);
end

endmodule