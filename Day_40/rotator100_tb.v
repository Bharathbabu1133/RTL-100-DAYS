`timescale 1ns/1ps

module rotator100_tb;

reg clk;
reg load;
reg [1:0] ena;
reg [99:0] data;
wire [99:0] q;

// Instantiate the DUT (Device Under Test)
rotator100 uut (
    .clk(clk),
    .load(load),
    .ena(ena),
    .data(data),
    .q(q)
);

// Clock generation (10 ns period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $display("Starting Simulation...");
    $monitor("Time=%0t | load=%b ena=%b data=%b q=%b",
              $time, load, ena, data, q);

    // Initialize
    load = 0;
    ena = 2'b00;
    data = 100'b0;

    // Load data into rotator
    #10;
    load = 1;
    data = 100'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010;

    #10;
    load = 0;

    // Rotate Right
    #10;
    ena = 2'b01;

    #50;

    // Rotate Left
    ena = 2'b10;

    #50;

    // No rotation
    ena = 2'b00;

    #20;

    // Load new pattern
    load = 1;
    data = 100'b1111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111;

    #10;
    load = 0;

    // Rotate Right again
    ena = 2'b01;

    #50;

    $display("Simulation Finished");
    $stop;

end

endmodule