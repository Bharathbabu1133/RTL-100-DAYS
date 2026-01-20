`timescale 1ns/1ps
module tb_sr_flip_flop;
reg s,r;
wire q,qn;

sr_flip_flop dut(
.s(s),
.r(r),
.q(q),
.qn(qn)
);

initial begin
s=1;r=1;
#10 s=0;r=1;
#10 s=1;r=1;
#10 s=1;r=0;
#10 s=1;r=1;
#10 s=0;r=0;
#10 s=1;r=1;
#10 $finish;
end

initial begin
$monitor("time=%0t s=%b r=%b q=%b qn=%b",$time,s,r,q,qn);
end
endmodule
