
# 4-Bit Synchronous Binary Counter

## Description
This project implements a 4-bit synchronous binary counter using Verilog.

The counter:
- Counts from 0 to 15 (0000 to 1111 in binary)
- Has a period of 16 clock cycles
- Uses a synchronous reset
- Resets to 0 when reset is high on the rising clock edge

## Files

- counter4.v         : Verilog module for 4-bit counter
- counter4_tb.v      : Testbench for simulation
- README.md          : Project documentation

## Port Description

### Inputs
- clk     : Clock input
- reset   : Synchronous reset input (active high)

### Outputs
- count   : 4-bit counter output

## Operation

On every rising edge of the clock:
- If reset is high → counter is set to 0000
- If reset is low → counter increments by 1
- After 1111 (15), it rolls over to 0000

## Simulation

Run the testbench in any Verilog simulator such as:
- ModelSim
- Vivado
- Icarus Verilog

Example using Icarus Verilog:
