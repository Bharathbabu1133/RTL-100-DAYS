`timescale 1ns / 1ps

module tb_signed_overflow;

    reg  signed [7:0] A, B;
    wire signed [7:0] SUM;
    wire OVERFLOW;

    // DUT instantiation
    signed_over_flow dut (
        .A(A),
        .B(B),
        .SUM(SUM),
        .OVERFLOW(OVERFLOW)
    );

    // Monitor values
    initial begin
        $monitor("TIME=%0t | A=%d | B=%d | SUM=%d | OVERFLOW=%b",
                  $time, A, B, SUM, OVERFLOW);
    end

  
    initial begin
       
        A = 8'sd10;   B = 8'sd20;   #10;
        A = -8'sd20;  B = 8'sd10;   #10;

        A = 8'sd127;  B = 8'sd1;    #10;

        A = -8'sd128; B = -8'sd1;   #10;

        A = 8'sd127;  B = 8'sd0;    #10;
        A = -8'sd128; B = 8'sd0;    #10;

        $finish;
    end

endmodule
