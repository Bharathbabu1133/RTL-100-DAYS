`timescale 1ns/1ps

module tb_dff_16_byteena;

reg clk;
reg resetn;
reg [1:0] byteena;
reg [15:0] d;
wire [15:0] q;

dff_16_byteena dut(
    .clk(clk),
    .resetn(resetn),
    .byteena(byteena),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    resetn = 0;
    byteena = 2'b00;
    d = 16'h0000;

    #10 resetn = 1;

    #10 byteena = 2'b01; d = 16'h00AA;
    #10 byteena = 2'b10; d = 16'hBB00;
    #10 byteena = 2'b11; d = 16'hCCDD;
    #10 byteena = 2'b00; d = 16'hFFFF;
    #10 resetn = 0;
    #10 resetn = 1;

    #20 $finish;
end

initial begin
    $monitor("time=%0t resetn=%b byteena=%b d=%h q=%h",
              $time, resetn, byteena, d, q);
end

endmodule
