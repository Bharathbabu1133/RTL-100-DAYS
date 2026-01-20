# 4-bit Full Adder using Verilog

## Overview

This project implements a **4-bit Full Adder** using **Verilog HDL**.
It demonstrates:

* **Dataflow modeling** for a 1-bit full adder
* **Structural (gate-level) modeling** by cascading four 1-bit full adders
* A **testbench** to verify the functionality using different input combinations

---

## Modules Description

### `fulladd` – 1-bit Full Adder (Dataflow Modeling)

This module performs single-bit addition with carry-in.

**Inputs:**

* `a` – First input bit
* `b` – Second input bit
* `cin` – Carry input

**Outputs:**

* `sum` – Sum output
* `carry` – Carry output

**Logic Used:**

```verilog
sum   = a ^ b ^ cin
carry = (a & b) | (b & cin) | (a & cin)
```

---

### `full_add4` – 4-bit Full Adder (Structural Modeling)

This top module connects **four 1-bit full adders** in cascade to perform 4-bit addition.

**Inputs:**

* `a[3:0]` – 4-bit input A
* `b[3:0]` – 4-bit input B
* `c_in` – Carry input

**Outputs:**

* `sum[3:0]` – 4-bit sum
* `c_out` – Final carry output

**Design Approach:**

* Carry from each stage is connected to the next stage
* Ripple Carry Adder architecture is used

---

## Testbench (`tb_full_add4`)

The testbench verifies the functionality of the 4-bit full adder by applying multiple test cases.

### Features:

* Uses `$display` and `$monitor` for real-time output
* Applies different combinations of inputs
* Simulation time scale: `1ns / 1ps`

### Sample Test Cases:

| A    | B    | Cin | Expected Result      |
| ---- | ---- | --- | -------------------- |
| 0000 | 0000 | 0   | Sum = 0000           |
| 0011 | 0101 | 0   | Sum = 1000           |
| 0111 | 0001 | 0   | Sum = 1000           |
| 1111 | 0001 | 0   | Sum = 0000, Cout = 1 |
| 1010 | 0101 | 1   | Sum = 0000, Cout = 1 |

---

## Timescale

```verilog
`timescale 1ns/1ps
```

* **1 ns** → simulation time unit
* **1 ps** → simulation precision


