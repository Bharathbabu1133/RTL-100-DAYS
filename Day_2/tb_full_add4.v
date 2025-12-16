`timescale 1ns / 1ps

module tb_full_add4;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        c_in;
    wire [3:0] sum;
    wire       c_out;

    
    full_add4 dut (
        .sum(sum),
        .c_out(c_out),
        .a(a),
        .b(b),
        .c_in(c_in)
    );

    initial begin
       
        $display("Time\t a\t b\t cin\t sum\t cout");
        $monitor("%0t\t %b\t %b\t %b\t %b\t %b",
                  $time, a, b, c_in, sum, c_out);

        
        a = 4'b0000; b = 4'b0000; c_in = 0; #10;
        a = 4'b0011; b = 4'b0101; c_in = 0; #10; 
        a = 4'b0111; b = 4'b0001; c_in = 0; #10; 
        a = 4'b1111; b = 4'b0001; c_in = 0; #10; 
        a = 4'b1010; b = 4'b0101; c_in = 1; #10; 

        #10 $finish;
    end

endmodule
