`timescale 1ns/1ps

module tb_t_flipflop;

reg t;
reg clk;
reg rst;
wire q;
wire qbar;

t_flip_flop dut(
    .t(t),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    t = 0;

    #12 rst = 0;

    #10 t = 1;
    #20 t = 0;
    #10 t = 1;
    #20 t = 1;
    #10 t = 0;

    #20 $finish;
end

initial begin
    $monitor("time=%0t rst=%b t=%b q=%b qbar=%b",
              $time, rst, t, q, qbar);
end

endmodule
