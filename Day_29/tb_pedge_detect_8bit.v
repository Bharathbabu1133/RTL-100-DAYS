module tb_pedge_detect_8bit;

    reg        clk;
    reg        rst;
    reg  [7:0] in;
    wire [7:0] pedge;

    pedge_detect_8bit dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .pedge(pedge)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        in  = 8'h00;

        #12 rst = 0;

        #10 in = 8'h02;   // bit1 rises
        #10 in = 8'h02;   // no change
        #10 in = 8'h0E;   // bits 1,2,3 rise
        #10 in = 8'h00;   // all fall
        #10 in = 8'h02;   // bit1 rises again
        #10 in = 8'h00;

        #30 $finish;
    end

endmodule
