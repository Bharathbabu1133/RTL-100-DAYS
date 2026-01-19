`timescale 1ns/1ps
module full_subtractor(
    input A,
    input B,
    input Bin,
    output Diff,
    output Bout
);
    wire A_n;
    wire x1;
    wire w1,w2,w3;

    not (A_n, A);
    xor (x1, A, B);
    xor (Diff, x1, Bin);

    and (w1, A_n, B);
    and (w2, A_n, Bin);
    and (w3, B, Bin);
    or  (Bout, w1, w2, w3);
endmodule
