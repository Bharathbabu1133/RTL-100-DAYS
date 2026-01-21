##  What is a Priority Encoder?

A **priority encoder** is a combinational circuit that:

* Accepts multiple input signals
* Outputs the binary code of the **highest-priority active input**
* Indicates whether any input is active using a **valid** signal

In this design, priority order is:

```
d[3] > d[2] > d[1] > d[0]
```

---

##  Design Details

### Module: `priority_encoder`

**Modeling Style:** Behavioral (using `always @(*)`)

### Inputs

* `d [3:0]` → 4-bit input vector

### Outputs

* `y [1:0]` → Encoded output
* `valid` → Indicates if any input is active

---

### Priority Logic

| Input `d` | Output `y` | `valid` |
| --------- | ---------- | ------- |
| `0000`    | `00`       | `0`     |
| `0001`    | `00`       | `1`     |
| `0010`    | `01`       | `1`     |
| `0100`    | `10`       | `1`     |
| `1000`    | `11`       | `1`     |
| `1111`    | `11`       | `1`     |

> If multiple inputs are `1`, the **highest-order bit** is selected.

---

## 🧪 Testbench (`tb_priority_encoder`)

The testbench:

* Applies single-bit and multi-bit input patterns
* Checks encoder priority behavior
* Uses `$monitor` to display real-time output changes

---

### Test Cases Covered

* No input active (`0000`)
* Single active bit (`0001`, `0010`, `0100`, `1000`)
* Multiple active bits (`0011`, `0110`, `1111`)

---

##  How to Simulate

1. Open a Verilog simulator:

   * ModelSim
   * Vivado
   * Icarus Verilog
2. Compile:

   * `priority_encoder.v`
   * `tb_priority_encoder.v`
3. Run the simulation
4. Observe outputs in console or waveform viewer

---

## Sample Simulation Output

```
Time=0  | d=0000 | y=00 | valid=0
Time=10 | d=0001 | y=00 | valid=1
Time=20 | d=0010 | y=01 | valid=1
Time=30 | d=0100 | y=10 | valid=1
Time=40 | d=1000 | y=11 | valid=1
Time=50 | d=1111 | y=11 | valid=1

