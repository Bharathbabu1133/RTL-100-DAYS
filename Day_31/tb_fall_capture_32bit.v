module tb_fall_capture_32bit;

    reg         clk;
    reg         reset;
    reg  [31:0] in;
    wire [31:0] out;

    fall_capture_32bit dut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;
        in    = 32'h00000000;

        #12 reset = 0;

        #10 in = 32'h00000002;
        #10 in = 32'h0000000E;
        #10 in = 32'h00000000;
        #10 in = 32'h00000002;
        #10 reset = 1;
        #10 reset = 0;
        #10 in = 32'h00000000;

        #30 $finish;
    end

endmodule
