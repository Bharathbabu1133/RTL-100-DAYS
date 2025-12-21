module comparator_8bit(
    input  [7:0] A,
    input  [7:0] B,
    output [2:0] out
);

assign out = (A > B)  ? 3'b011 :
             (A < B)  ? 3'b010 :
             (A == B) ? 3'b001 :
                        3'b000;

endmodule
