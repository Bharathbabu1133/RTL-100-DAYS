### 1-Bit Full Adder (`fulladd`)

**Modeling Style:** Dataflow

**Inputs:**

* `a` – 1-bit input
* `b` – 1-bit input
* `cin` – Carry input

**Outputs:**

* `sum` – Sum output
* `carry` – Carry output

**Logic Used:**

* `sum = a ^ b ^ cin`
* `carry = (a & b) | (b & cin) | (a & cin)`

---

### 4-Bit Full Adder (`full_add4`)

**Modeling Style:** Structural (Gate-Level using instantiation)

**Inputs:**

* `a[3:0]` – 4-bit input A
* `b[3:0]` – 4-bit input B
* `c_in` – Carry input

**Outputs:**

* `sum[3:0]` – 4-bit sum
* `c_out` – Final carry output

**Description:**

* Four 1-bit full adders are connected in series.
* Carry output of each stage is connected to the carry input of the next stage.
* This forms a **Ripple Carry Adder**.

---

## 🧪 Testbench Description (`tb_full_add4`)

The testbench:

* Applies different combinations of inputs `a`, `b`, and `c_in`
* Monitors and displays the output using `$monitor`
* Uses a delay of `#10` between test cases

### Test Cases Covered:

| A    | B    | Cin | Expected Result      |
| ---- | ---- | --- | -------------------- |
| 0000 | 0000 | 0   | Sum = 0000, Cout = 0 |
| 0011 | 0101 | 0   | Sum = 1000, Cout = 0 |
| 0111 | 0001 | 0   | Sum = 1000, Cout = 0 |
| 1111 | 0001 | 0   | Sum = 0000, Cout = 1 |
| 1010 | 0101 | 1   | Sum = 0000, Cout = 1 |

---

## How to Run the Simulation

1. Open a Verilog simulator (ModelSim / QuestaSim / Vivado / Icarus Verilog)
2. Compile all design and testbench files
3. Run the simulation
4. Observe the output in the console or waveform window

---

## Sample Output Format

```
Time   a      b      cin   sum    cout
0      0000   0000   0     0000   0
10     0011   0101   0     1000   0
20     0111   0001   0     1000   0
30     1111   0001   0     0000   1
40     1010   0101   1     0000   1

