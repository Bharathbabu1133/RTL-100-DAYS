`timescale 1ns/1ps
module nor_universal(
    input A,
    input B,
    output AND_out,
    output OR_out,
    output NOT_A
);
    wire n1,n2,n3;

    nor (n1, A, B);
    nor (OR_out, n1, n1);

    nor (n2, A, A);
    nor (n3, B, B);
    nor (AND_out, n2, n3);

    nor (NOT_A, A, A);
endmodule
