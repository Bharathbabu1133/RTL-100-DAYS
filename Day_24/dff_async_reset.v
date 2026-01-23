`timescale 1ns/1ps
module dff_async_reset(
    input d,
    input clk,
    input ar,
    output reg q
);

always @(posedge clk or posedge ar)
begin
    if (ar)
        q <= 1'b0;
    else
        q <= d;
end

endmodule
