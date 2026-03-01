# Synchronous Decade Counter (1–10)

## Description
This project implements a 4-bit synchronous decade counter in Verilog.

The counter:
- Counts from 1 to 10
- Has a period of 10 clock cycles
- Uses a synchronous reset
- Resets to 1 when reset is high on the rising edge of the clock

## Files

- decade_counter_1_to_10.v      : Verilog module
- decade_counter_1_to_10_tb.v   : Testbench
- README.md                     : Documentation

## Port Description

### Inputs
- clk     : Clock input
- reset   : Synchronous reset input (active high)

### Outputs
- count   : 4-bit counter output (1–10)

## Operation

On every rising edge of the clock:
- If reset is high → counter is set to 1
- If reset is low:
  - Counter increments from 1 to 10
  - When count reaches 10, next value becomes 1

## Simulation

Example using Icarus Verilog:

iverilog -o decade_counter_1_to_10_tb decade_counter_1_to_10.v decade_counter_1_to_10_tb.v  
vvp decade_counter_1_to_10_tb

The console output will show counting from 1 to 10 repeatedly and resetting to 1 when reset is asserted.
