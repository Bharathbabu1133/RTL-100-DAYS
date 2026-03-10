
# 100-bit Left/Right Rotator (Verilog)

## Overview
This project implements a **100-bit rotator** in Verilog.  
A rotator performs **circular shifting**, meaning the bit that shifts out from one end re-enters at the other end.

Unlike a normal shifter that discards bits and inserts zeros, the rotator **preserves all bits**.

---

## Features

- 100-bit register
- Synchronous load
- Left rotate
- Right rotate
- Hold operation

---

## Inputs

| Signal | Width | Description |
|------|------|-------------|
| clk | 1 | Clock signal |
| load | 1 | Loads `data` into the register |
| ena | 2 | Selects rotate direction |
| data | 100 | Input data |

---

## Output

| Signal | Width | Description |
|------|------|-------------|
| q | 100 | Rotator output |

---

## Rotation Control

| ena | Operation |
|----|-----------|
| 2'b01 | Rotate Right |
| 2'b10 | Rotate Left |
| 2'b00 | No rotation |
| 2'b11 | No rotation |

---

## Rotator Operation

### Rotate Right

Example:

Before rotation
