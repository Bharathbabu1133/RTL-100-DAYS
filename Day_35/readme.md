
# Synchronous Decade Counter (0–9) with Enable

## Description
This project implements a 4-bit synchronous decade counter using Verilog.

Features:
- Counts from 0 to 9
- Period of 10 clock cycles
- Synchronous reset (active high)
- Enable input (slowena) to pause counting

## Files

- decade_counter_with_enable.v
- decade_counter_with_enable_tb.v
- README.md

## Port Description

### Inputs
- clk      : Clock input
- reset    : Synchronous reset input (active high)
- slowena  : Enable signal (count increments only when high)

### Outputs
- count    : 4-bit counter output (0–9)

## Operation

On every rising edge of the clock:

1. If reset = 1 → counter resets to 0
2. If reset = 0 and slowena = 1:
   - Counter increments from 0 to 9
   - After 9, it wraps back to 0
3. If slowena = 0:
   - Counter holds its current value

## Simulation Example (Icarus Verilog)

iverilog -o decade_counter_with_enable_tb decade_counter_with_enable.v decade_counter_with_enable_tb.v  
vvp decade_counter_with_enable_tb

The simulation output shows:
- Normal counting when slowena = 1
- Counter pausing when slowena = 0
- Reset behavior when reset is asserted
