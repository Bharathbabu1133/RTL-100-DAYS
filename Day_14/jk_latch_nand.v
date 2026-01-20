`timescale 1ns/1ps
module jk_latch_nand(
    input j,
    input k,
    input en,
    output q,
    output qbar
);

wire jn;
wire kn;

assign jn = ~(j & en & qbar);
assign kn = ~(k & en & q);

assign q    = ~(jn & qbar);
assign qbar = ~(kn & q);

endmodule
