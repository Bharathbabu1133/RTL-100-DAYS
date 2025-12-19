`timescale 1ns / 1ps

module tb_mux_4to1;

    reg  [3:0] d;      
    reg  [1:0] sel;    
    wire       y;      

 
    mux_4to1 dut (
        .d(d),
        .sel(sel),
        .y(y)
    );

    initial begin
       
        $display("Time\t sel \t d \t y");
        $monitor("%0t\t %b \t %b \t %b", $time, sel, d, y);

       
        d = 4'b1010;   

        sel = 2'b00; #10;   
        sel = 2'b01; #10;   
        sel = 2'b10; #10;   
        sel = 2'b11; #10;   

       
        d = 4'b0111;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end

endmodule
