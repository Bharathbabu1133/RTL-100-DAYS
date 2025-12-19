`timescale 1ns / 1ps

module tb_alu_8bit;

    reg  [7:0] a, b;
    reg  [2:0] alu_signal;
    wire [7:0] alu_out;
    wire carry;

    
    alu_8bit dut (
        .a(a),
        .b(b),
        .alu_signal(alu_signal),
        .alu_out(alu_out),
        .carry(carry)
    );

    initial begin
        
        $monitor("Time=%0t | a=%h b=%h | alu_signal=%b | alu_out=%h carry=%b",
                  $time, a, b, alu_signal, alu_out, carry);

       
        a = 8'h00;
        b = 8'h00;
        alu_signal = 3'b000;

        #10;
        
        a = 8'h25; 
        b = 8'h13; 
        alu_signal = 3'b000;   

        #10;
        
        alu_signal = 3'b001;   

        #10;
        
        alu_signal = 3'b010;

        #10;
        
        alu_signal = 3'b011;

        #10;
        
        alu_signal = 3'b100;

        #10;
       
        alu_signal = 3'b101;

        #10;
        
        a = 8'hFF;
        b = 8'h01;
        alu_signal = 3'b000;

        #10;
        $finish;
    end

endmodule
