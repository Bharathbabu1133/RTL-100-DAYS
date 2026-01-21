`timescale 1ns/1ps

module tb_dff_8;

reg clk;
reg [7:0] d;
wire [7:0] q;

dff_8 dut(
    .clk(clk),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    d = 8'b00000000;
    #10 d = 8'b00000001;
    #10 d = 8'b00001111;
    #10 d = 8'b10101010;
    #10 d = 8'b11110000;
    #10 d = 8'b11111111;
    #20 $finish;
end

initial begin
    $monitor("time=%0t d=%b q=%b", $time, d, q);
end

endmodule
