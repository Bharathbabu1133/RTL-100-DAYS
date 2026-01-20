`timescale 1ns/1ps
module sr_latch_nand(
    input s_n,
    input r_n,
    output q,
    output qbar
);

assign q    = ~(s_n & qbar);
assign qbar = ~(r_n & q);

endmodule
