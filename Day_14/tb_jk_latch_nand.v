`timescale 1ns/1ps
module tb_jk_latch_nand;

reg j;
reg k;
reg en;
reg init;
wire q;
wire qbar;

jk_latch_nand dut(
    .j(j),
    .k(k),
    .en(en),
    .q(q),
    .qbar(qbar)
);

initial begin
    force dut.q = 0;
    force dut.qbar = 1;
    #1;
    release dut.q;
    release dut.qbar;
end

initial begin
    $monitor("time=%0t en=%b j=%b k=%b q=%b qbar=%b", $time, en, j, k, q, qbar);

    en = 0; j = 0; k = 0; #10;
    en = 1; j = 1; k = 0; #10;
    en = 1; j = 0; k = 0; #10;
    en = 1; j = 0; k = 1; #10;
    en = 1; j = 0; k = 0; #10;
    en = 1; j = 1; k = 1; #20;
    en = 0; j = 0; k = 0; #10;

    $finish;
end

endmodule
