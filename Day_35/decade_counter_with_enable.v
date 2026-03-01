module decade_counter_with_enable (
    input clk,
    input reset,
    input slowena,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset)
        count <= 4'd0;
    else if (slowena) begin
        if (count == 4'd9)
            count <= 4'd0;
        else
            count <= count + 1'b1;
    end
end

endmodule