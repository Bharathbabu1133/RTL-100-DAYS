`timescale 1ns / 1ps


module mux_4to1(
input [3:0]d,
input [1:0]sel,
output y
    );
    
assign y = (sel[1] == 1'b0) ?
           (
             (sel[0] == 1'b0) ? d[0] : d[1]
           ) :
           (
             (sel[0] == 1'b0) ? d[2] : d[3]
           );
    
endmodule
