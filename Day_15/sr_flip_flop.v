`timescale 1ns/1ps
module sr_flip_flop(
input s,
input r,
output q,
output qn
);
wire n1,n2;
assign n1 = ~(s & qn);
assign n2 = ~(r & q);
assign q  = n1;
assign qn = n2;
endmodule
