`timescale 1ns/1ps
module tb_binary_to_gray;

reg  [3:0] bin;
wire [3:0] gray;
integer i;

binary_to_gray dut(
    .bin(bin),
    .gray(gray)
);

initial begin
    $monitor("binary=%b gray=%b", bin, gray);
    for (i = 0; i < 16; i = i + 1) begin
        bin = i;
        #10;
    end
    $finish;
end

endmodule
