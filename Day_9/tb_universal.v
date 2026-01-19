`timescale 1ns/1ps
module tb_universal;
    reg A,B;
    wire nand_and,nand_or,nand_not;
    wire nor_and,nor_or,nor_not;
    integer i;

    nand_universal u1(
        .A(A),
        .B(B),
        .AND_out(nand_and),
        .OR_out(nand_or),
        .NOT_A(nand_not)
    );

    nor_universal u2(
        .A(A),
        .B(B),
        .AND_out(nor_and),
        .OR_out(nor_or),
        .NOT_A(nor_not)
    );

    initial begin
        $monitor("A=%b B=%b | NAND_AND=%b NAND_OR=%b NAND_NOT=%b | NOR_AND=%b NOR_OR=%b NOR_NOT=%b",
                  A,B,nand_and,nand_or,nand_not,nor_and,nor_or,nor_not);
        for(i=0;i<4;i=i+1) begin
            {A,B}=i;
            #10;
        end
        $finish;
    end
endmodule
