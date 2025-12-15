`timescale 1ns / 1ps

module signed_over_flow(
    input  signed [7:0] A,
    input  signed [7:0] B,
    output reg signed [7:0] SUM,
    output reg OVERFLOW
);

always @(*) begin
    SUM = A + B;


    if ((A[7] == B[7]) && (SUM[7] != A[7]))
        OVERFLOW = 1'b1;
    else
        OVERFLOW = 1'b0;
end

endmodule
