
# 12 Hour Digital Clock (Verilog)

## Description

This project implements a **12-hour digital clock** in Verilog HDL with:

- Hours: 01–12 (BCD)
- Minutes: 00–59 (BCD)
- Seconds: 00–59 (BCD)
- AM/PM indicator

The clock increments when the signal `ena` is asserted. This signal should be generated once per second using a frequency divider.

Reset initializes the clock to:

12:00:00 AM

Reset has higher priority than enable.

---

## Inputs

| Signal | Description |
|------|-------------|
| clk | System clock |
| reset | Synchronous reset |
| ena | Enable signal (1 second pulse) |

---

## Outputs

| Signal | Description |
|------|-------------|
| hh | Hours in BCD |
| mm | Minutes in BCD |
| ss | Seconds in BCD |
| pm | AM/PM indicator |

pm = 0 → AM  
pm = 1 → PM

---

## Clock Behaviour

Seconds count:

00 → 59

Minutes count:

00 → 59

Hours count:

01 → 12

Special transitions:

11:59:59 AM → 12:00:00 PM

12:59:59 → 01:00:00

---

## Example Transition
