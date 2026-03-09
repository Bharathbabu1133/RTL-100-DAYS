`timescale 1ns/1ps

module clock12_tb;

reg clk;
reg reset;
reg ena;

wire pm;
wire [7:0] hh;
wire [7:0] mm;
wire [7:0] ss;

clock12 uut(
    .clk(clk),
    .reset(reset),
    .ena(ena),
    .pm(pm),
    .hh(hh),
    .mm(mm),
    .ss(ss)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    ena = 0;

    #20
    reset = 0;
    ena = 1;

    #2000

    $finish;

end

initial begin
    $monitor("time=%0t  %h:%h:%h  pm=%b", $time, hh, mm, ss, pm);
end

endmodule