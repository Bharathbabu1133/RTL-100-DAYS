`timescale 1ns/1ps

module shift_reg4_tb;

reg clk;
reg areset;
reg load;
reg ena;
reg [3:0] data;

wire [3:0] q;

shift_reg4 uut(
    .clk(clk),
    .areset(areset),
    .load(load),
    .ena(ena),
    .data(data),
    .q(q)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    areset = 1;
    load = 0;
    ena = 0;
    data = 4'b0000;

    #10
    areset = 0;

    #10
    load = 1;
    data = 4'b1011;

    #10
    load = 0;
    ena = 1;

    #50
    ena = 0;

    #20
    $finish;

end

initial begin
    $monitor("time=%0t  q=%b", $time, q);
end

endmodule