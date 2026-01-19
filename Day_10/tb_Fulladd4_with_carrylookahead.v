`timescale 1ns / 1ps

module tb_Fulladd4_with_carrylookahead;

reg [3:0] a, b;
reg c_in;
wire [3:0] sum;
wire c_out;

Fulladd4_with_carrylookahead dut(
    .a(a),
    .b(b),
    .c_in(c_in),
    .sum(sum),
    .c_out(c_out)
);

initial begin
    $monitor("time=%0t a=%b b=%b cin=%b sum=%b cout=%b", $time, a, b, c_in, sum, c_out);
    
    a=4'b0000; b=4'b0000; c_in=0; #10;
    a=4'b0011; b=4'b0101; c_in=0; #10;
    a=4'b1111; b=4'b0001; c_in=0; #10;
    a=4'b1010; b=4'b0101; c_in=1; #10;
    a=4'b1111; b=4'b1111; c_in=1; #10;

    $finish;
end

endmodule
