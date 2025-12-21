`timescale 1ns / 1ps

module tb_8bit_comparator;

    reg  [7:0] A;
    reg  [7:0] B;
    wire [2:0] out;

   
    comparator_8bit dut (
        .A(A),
        .B(B),
        .out(out)
    );

    initial begin
        
        $monitor("Time=%0t | A=%d | B=%d | out=%b", $time, A, B, out);

        
        A = 8'd25; B = 8'd10;
        #10;

        
        A = 8'd5;  B = 8'd20;
        #10;

        
        A = 8'd15; B = 8'd15;
        #10;

        
        A = 8'd255; B = 8'd0;
        #10;

        
        A = 8'd0; B = 8'd255;
        #10;

        $finish;
    end

endmodule
