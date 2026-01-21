## What is a Full Subtractor?

A **full subtractor** is a combinational circuit that:

* Subtracts two input bits `A` and `B`
* Considers a **borrow-in (Bin)**
* Produces a **difference (Diff)** and **borrow-out (Bout)**

---

##  Design Details

### Module: `full_subtractor`

**Modeling Style:** Gate-Level Modeling

### Inputs

* `A` → Minuend bit
* `B` → Subtrahend bit
* `Bin` → Borrow input

### Outputs

* `Diff` → Difference output
* `Bout` → Borrow output

---

## Logic Equations

* **Difference**

  ```
  Diff = A ⊕ B ⊕ Bin
  ```

* **Borrow Out**

  ```
  Bout = (~A & B) | (~A & Bin) | (B & Bin)
  ```

The design uses basic logic gates:

* `NOT`
* `XOR`
* `AND`
* `OR`

---

##  Testbench (`tb_full_subtractor`)

The testbench:

* Applies **all possible input combinations** (`A`, `B`, `Bin`)
* Uses a `for` loop to generate 8 test cases
* Displays outputs using `$monitor`

This ensures **complete functional verification**.

---

## Truth Table

| A | B | Bin | Diff | Bout |
| - | - | --- | ---- | ---- |
| 0 | 0 | 0   | 0    | 0    |
| 0 | 0 | 1   | 1    | 1    |
| 0 | 1 | 0   | 1    | 1    |
| 0 | 1 | 1   | 0    | 1    |
| 1 | 0 | 0   | 1    | 0    |
| 1 | 0 | 1   | 0    | 0    |
| 1 | 1 | 0   | 0    | 0    |
| 1 | 1 | 1   | 1    | 1    |

---

## How to Simulate

1. Open a Verilog simulator:

   * ModelSim
   * Vivado
   * Icarus Verilog
2. Compile:

   * `full_subtractor.v`
   * `tb_full_subtractor.v`
3. Run the simulation
4. Observe results in console or waveform viewer

---

## Sample Simulation Output

```
A=0 B=0 Bin=0 Diff=0 Bout=0
A=0 B=0 Bin=1 Diff=1 Bout=1
A=0 B=1 Bin=0 Diff=1 Bout=1
A=1 B=1 Bin=1 Diff=1 Bout=1
