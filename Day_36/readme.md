# 1–12 Counter with Control Signals

## Description
This project implements a 1–12 synchronous counter in Verilog.

Features:
- Counts from 1 to 12
- Synchronous active-high reset to 1
- Enable input controls counting
- Generates control signals for a 4-bit counter:
  - c_enable
  - c_load
  - c_d[3:0]

## Port Description

### Inputs
- Clk     : Positive-edge clock
- Reset   : Synchronous reset (active high, sets counter to 1)
- Enable  : Enables counting when high

### Outputs
- Q[3:0]     : Counter output (1–12)
- c_enable   : Enable control for internal counter
- c_load     : Load control when wrapping to 1
- c_d[3:0]   : Data input value (1)

## Operation

On rising edge of clock:

1. If Reset = 1 → Counter loads 1
2. If Enable = 1:
   - Counter increments from 1 to 12
   - When Q = 12 → loads 1 on next clock
3. If Enable = 0:
   - Counter holds its value

## Counting Sequence

1 → 2 → 3 → ... → 12 → 1 → 2 → ...

## Simulation

Example using Icarus Verilog:

iverilog -o counter_1_to_12_tb counter_1_to_12.v counter_1_to_12_tb.v  
vvp counter_1_to_12_tb

The output verifies:
- Proper counting
- Correct wrap from 12 to 1
- Reset behavior
- Control signal correctness
