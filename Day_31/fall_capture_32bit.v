module fall_capture_32bit (
    input  wire        clk,
    input  wire        reset,
    input  wire [31:0] in,
    output reg  [31:0] out
);

    reg [31:0] in_d;

    always @(posedge clk) begin
        if (reset) begin
            out  <= 32'b0;
            in_d <= in;
        end else begin
            out  <= out | (in_d & ~in);
            in_d <= in;
        end
    end

endmodule
