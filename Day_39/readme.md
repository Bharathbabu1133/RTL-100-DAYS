# 4-Bit Shift Register (Right Shift)

## Overview

This project implements a **4-bit right shift register** in Verilog HDL.  
The design supports the following operations:

- **Asynchronous reset**
- **Synchronous parallel load**
- **Right shift operation**
- **Enable control**
- **Priority control (load > enable)**

The shift register stores a 4-bit value and can shift its contents to the right when enabled.

---

## Module Description

### Inputs

| Signal | Width | Description |
|------|------|-------------|
| clk | 1 | System clock |
| areset | 1 | Asynchronous reset (active high) |
| load | 1 | Loads `data` into the register |
| ena | 1 | Enables right shift |
| data | 4 | Parallel data input |

### Output

| Signal | Width | Description |
|------|------|-------------|
| q | 4 | Current contents of the shift register |

---

## Functional Behavior

### 1. Asynchronous Reset

When `areset = 1`, the register immediately resets:

