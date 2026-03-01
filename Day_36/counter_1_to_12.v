module counter_1_to_12 (
    input Clk,
    input Reset,
    input Enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

reg [3:0] q_reg;

assign Q = q_reg;

assign c_enable = Enable && (q_reg != 4'd12);
assign c_load   = Reset || (Enable && (q_reg == 4'd12));
assign c_d      = Reset ? 4'd1 : 4'd1;

always @(posedge Clk) begin
    if (Reset)
        q_reg <= 4'd1;
    else if (Enable) begin
        if (q_reg == 4'd12)
            q_reg <= 4'd1;
        else
            q_reg <= q_reg + 1'b1;
    end
end

endmodule