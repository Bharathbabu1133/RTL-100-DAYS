
module Nand_as_universal(
    input A,
    input B,
    output AND_out,
    output OR_out,
    output NOT_A
);
    wire n1,n2,n3;

    nand (n1, A, B);
    nand (AND_out, n1, n1);

    nand (n2, A, A);
    nand (n3, B, B);
    nand (OR_out, n2, n3);

    nand (NOT_A, A, A);
endmodule
