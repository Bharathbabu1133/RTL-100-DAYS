
# Synchronous Decade Counter (0–9)

## Description
This project implements a 4-bit synchronous decade counter using Verilog.

The counter:
- Counts from 0 to 9
- Has a period of 10 clock cycles
- Uses a synchronous reset
- Resets to 0 when reset is high on the rising edge of the clock

## Files

- decade_counter.v        : Verilog module for decade counter
- decade_counter_tb.v     : Testbench for simulation
- README.md               : Project documentation

## Port Description

### Inputs
- clk     : Clock input
- reset   : Synchronous reset input (active high)

### Outputs
- count   : 4-bit counter output (0–9)

## Operation

On every rising edge of the clock:
- If reset is high → counter is set to 0
- If reset is low:
  - Counter increments from 0 to 9
  - When count reaches 9, next value becomes 0

## Simulation

Run using any Verilog simulator such as:
- ModelSim
- Vivado
- Icarus Verilog

Example using Icarus Verilog:
