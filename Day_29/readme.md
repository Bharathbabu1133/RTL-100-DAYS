# 8-bit Positive Edge Detector (Verilog)

## 📌 Overview
This project implements an **8-bit positive edge detector** in Verilog.  
For each bit in an 8-bit input vector, the circuit detects a **0 → 1 transition**
between consecutive clock cycles and generates a **single-clock-cycle pulse**
on the corresponding output bit.

This is similar to positive-edge detection, but applied **bitwise** to a vector.

---

## ✨ Features
- Per-bit rising edge detection for an 8-bit input
- Output pulse lasts exactly **one clock cycle**
- Output is asserted **one clock cycle after** the transition occurs
- Fully synthesizable RTL design
- Simple and scalable architecture

---

## 🔧 Module Description

### Module Name
`pedge_detect_8bit`

### Ports

| Signal | Direction | Width | Description |
|------|----------|-------|-------------|
| `clk` | Input | 1 | System clock (positive edge triggered) |
| `rst` | Input | 1 | Active-high synchronous reset |
| `in` | Input | 8 | 8-bit input signal |
| `pedge` | Output | 8 | One-cycle pulse for each detected rising edge |

---

## ⚙️ Functional Behavior
- The input is sampled on every rising edge of `clk`
- Each bit is compared with its previous value
- If a bit transitions from `0` to `1`, the corresponding output bit is set to `1`
- The output pulse lasts for **exactly one clock cycle**

### Logic Used
