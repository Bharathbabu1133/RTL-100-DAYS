`timescale 1ns / 1ps

module tb_priority_encoder;

    reg  [3:0] d;
    wire [1:0] y;
    wire valid;

    priority_encoder dut (
        .d(d),
        .y(y),
        .valid(valid)
    );

    initial begin
        
        $monitor("Time=%0t | d=%b | y=%b | valid=%b",
                  $time, d, y, valid);

        
        d = 4'b0000; #10;   
        d = 4'b0001; #10;  
        d = 4'b0010; #10;   
        d = 4'b0100; #10;   
        d = 4'b1000; #10;   

        
        d = 4'b0011; #10;   
        d = 4'b0110; #10;   
        d = 4'b1111; #10;   

        $finish;
    end

endmodule
