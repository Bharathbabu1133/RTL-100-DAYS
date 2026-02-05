module pedge_detect_8bit (
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  in,
    output reg  [7:0]  pedge
);

    reg [7:0] in_d;

    always @(posedge clk) begin
        if (rst) begin
            in_d  <= 8'b0;
            pedge <= 8'b0;
        end else begin
            pedge <= (~in_d) & in;
            in_d  <= in;
        end
    end

endmodule
