`timescale 1ns / 1ps

module Fulladd4_with_carrylookahead(
    sum,
    c_out,
    a,
    b,
    c_in
);

output [3:0] sum;
output c_out;
input [3:0] a, b;
input c_in;

wire p0, g0, p1, g1, p2, g2, p3, g3;
wire c1, c2, c3, c4;

assign p0 = a[0] ^ b[0];
assign p1 = a[1] ^ b[1];
assign p2 = a[2] ^ b[2];
assign p3 = a[3] ^ b[3];

assign g0 = a[0] & b[0];
assign g1 = a[1] & b[1];
assign g2 = a[2] & b[2];
assign g3 = a[3] & b[3];

assign c1 = g0 | (p0 & c_in);
assign c2 = g1 | (p1 & g0) | (p1 & p0 & c_in);
assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & c_in);
assign c4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & c_in);

assign sum[0] = p0 ^ c_in;
assign sum[1] = p1 ^ c1;
assign sum[2] = p2 ^ c2;
assign sum[3] = p3 ^ c3;

assign c_out = c4;

endmodule
