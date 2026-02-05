
# 8-bit Any-Edge Detector (Verilog)

## Overview
This project implements an 8-bit **any-edge detector** in Verilog.  
For each bit of the input vector, the circuit detects **any change**
between consecutive clock cycles, including both rising (0→1) and
falling (1→0) transitions.

When a change occurs on a bit, the corresponding output bit is asserted
for **one clock cycle**, **one cycle after** the transition.

---

## Features
- Bitwise edge detection for an 8-bit vector
- Detects both rising and falling edges
- One-clock-cycle output pulse per transition
- Output aligned one cycle after input change
- Fully synthesizable RTL design

---

## Module Interface

### Module Name
`anyedge_detect_8bit`

### Ports

| Signal | Direction | Width | Description |
|------|----------|-------|-------------|
| `clk` | Input | 1 | Positive-edge-triggered clock |
| `rst` | Input | 1 | Active-high synchronous reset |
| `in` | Input | 8 | 8-bit input signal |
| `anyedge` | Output | 8 | One-cycle pulse indicating any bit change |

---

## Functional Description
- The input vector is sampled on every rising edge of the clock
- Each bit is compared with its previous value
- If a bit changes state, the corresponding output bit goes high
- The output pulse lasts exactly one clock cycle

### Detection Logic
