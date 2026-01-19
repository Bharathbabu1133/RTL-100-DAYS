`timescale 1ns/1ps
module tb_full_subtractor;
    reg A,B,Bin;
    wire Diff,Bout;
    integer i;

    full_subtractor dut(
        .A(A),
        .B(B),
        .Bin(Bin),
        .Diff(Diff),
        .Bout(Bout)
    );

    initial begin
        $monitor("A=%b B=%b Bin=%b Diff=%b Bout=%b",A,B,Bin,Diff,Bout);
        for(i=0;i<8;i=i+1) begin
            {A,B,Bin}=i;
            #10;
        end
        $finish;
    end
endmodule
