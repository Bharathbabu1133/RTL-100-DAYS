`timescale 1ns/1ps
module tb_decimal_to_binary;

reg [3:0] dec;
wire [3:0] bin;
integer j;

decimal_to_binary dut(
    .dec(dec),
    .bin(bin)
);

initial begin
    $monitor("time=%0t bin=%b", $time, bin);
    for (j = 0; j < 10; j = j + 1) begin
        dec = j;
        #10;
    end
    $finish;
end

endmodule
