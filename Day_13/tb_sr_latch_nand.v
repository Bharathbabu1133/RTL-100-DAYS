`timescale 1ns/1ps
module tb_sr_latch_nand;

reg s_n;
reg r_n;
wire q;
wire qbar;

sr_latch_nand dut(
    .s_n(s_n),
    .r_n(r_n),
    .q(q),
    .qbar(qbar)
);

initial begin
    $monitor("time=%0t s_n=%b r_n=%b q=%b qbar=%b", $time, s_n, r_n, q, qbar);

    s_n = 1; r_n = 1; #10;
    s_n = 0; r_n = 1; #10;
    s_n = 1; r_n = 1; #10;
    s_n = 1; r_n = 0; #10;
    s_n = 1; r_n = 1; #10;
    s_n = 0; r_n = 0; #10;

    $finish;
end

endmodule
