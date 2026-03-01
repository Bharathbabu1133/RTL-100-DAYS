
# 1000 Hz to 1 Hz Frequency Divider Using BCD Counters

## Objective
Generate a 1 Hz pulse (OneHertz) from a 1000 Hz clock.

The OneHertz signal must:
- Be high for exactly one clock cycle
- Occur once every 1000 clock cycles

## Design Approach

1000 = 10 × 10 × 10

Three cascaded modulo-10 (BCD) counters are used.

Counter 0 (Fastest)
- Always enabled
- Counts every clock cycle

Counter 1
- Enabled when Counter 0 reaches 9

Counter 2 (Slowest)
- Enabled when Counter 0 and Counter 1 both reach 9

## OneHertz Generation

OneHertz is asserted when:

q0 == 9 AND
q1 == 9 AND
q2 == 9

This condition happens once every 1000 clock cycles.

## Outputs

- OneHertz      : 1-cycle pulse every second
- c_enable[0]   : Enable for fastest BCD counter
- c_enable[1]   : Enable for middle BCD counter
- c_enable[2]   : Enable for slowest BCD counter

## Operation Sequence

Clock cycles:

000 → 001 → ... → 998 → 999 → 000

At count 999:
- OneHertz = 1 (for one cycle only)

## Simulation

Example (Icarus Verilog):

iverilog -o freq_divider_tb freq_divider_1000_to_1.v freq_divider_tb.v
vvp freq_divider_tb

The simulation verifies:
- Proper cascading
- Correct enable generation
- One-cycle wide 1 Hz pulse
