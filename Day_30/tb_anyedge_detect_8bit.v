module tb_anyedge_detect_8bit;

    reg        clk;
    reg        rst;
    reg  [7:0] in;
    wire [7:0] anyedge;

    anyedge_detect_8bit dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .anyedge(anyedge)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        in  = 8'h00;

        #12 rst = 0;

        #10 in = 8'h02;
        #10 in = 8'h02;
        #10 in = 8'h0E;
        #10 in = 8'h00;
        #10 in = 8'h02;
        #10 in = 8'h00;

        #30 $finish;
    end

endmodule
