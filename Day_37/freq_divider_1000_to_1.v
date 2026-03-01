module freq_divider_1000_to_1 (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);

wire [3:0] q0;
wire [3:0] q1;
wire [3:0] q2;

assign c_enable[0] = 1'b1;
assign c_enable[1] = (q0 == 4'd9);
assign c_enable[2] = (q0 == 4'd9) && (q1 == 4'd9);

assign OneHertz = (q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9);

bcd_counter counter0 (
    .clk(clk),
    .reset(reset),
    .enable(c_enable[0]),
    .q(q0)
);

bcd_counter counter1 (
    .clk(clk),
    .reset(reset),
    .enable(c_enable[1]),
    .q(q1)
);

bcd_counter counter2 (
    .clk(clk),
    .reset(reset),
    .enable(c_enable[2]),
    .q(q2)
);

endmodule