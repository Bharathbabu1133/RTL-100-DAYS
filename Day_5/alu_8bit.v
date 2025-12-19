`timescale 1ns / 1ps

module alu_8bit(
input [7:0]a,b,
input [2:0]alu_signal,
output reg[7:0]alu_out,
output reg carry
    );
    
    always @(*) begin
    carry = 0;
     
     case(alu_signal) 
     3'b000 : begin
   { carry, alu_out} = a+b;
    end
    
    3'b001: begin
    alu_out = a-b ;
    end
    
    3'b010:begin 
    alu_out = ~(a & b);
    end
    
    3'b011:begin
    alu_out = ~(a | b);
    end
    
    3'b100:begin 
    alu_out = ~{a[6:0],a[7]};
    end 
    
      3'b101:begin 
    alu_out = ~{a[0],a[7:1]};
    end 
    
    default: alu_out = 8'b00000000;
    
    
    endcase
    end
    
endmodule
