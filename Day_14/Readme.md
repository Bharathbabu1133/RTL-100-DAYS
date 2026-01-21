### What is a JK Latch?

A **JK latch** is a level-sensitive sequential circuit derived from the SR latch.

Key features:

* No invalid input condition
* Toggle operation when `J = K = 1`
* Controlled by an **Enable (EN)** signal

## JK Latch Truth Table (EN = 1)

| J | K | Q (Next) | Operation |
| - | - | -------- | --------- |
| 0 | 0 | Q        | Hold      |
| 0 | 1 | 0        | Reset     |
| 1 | 0 | 1        | Set       |
| 1 | 1 | Q̅       | Toggle    |

## Module Details

### Module Name

`jk_latch_nand`

### Inputs

* `j`  → Set input
* `k`  → Reset input
* `en` → Enable signal

### Outputs

* `q`    → Stored output
* `qbar` → Complement of `q`

### Modeling Style

* **Dataflow modeling**
* Implemented using **NAND gate logic**
* Feedback ensures memory behavior

---

## RTL Logic Explanation

```verilog
assign jn = ~(j & en & qbar);
assign kn = ~(k & en & q);

assign q    = ~(jn & qbar);
assign qbar = ~(kn & q);
```

* `jn` and `kn` act as gated inputs
* Enable controls latch transparency
* Feedback allows toggle when `J = K = 1`

---

## Testbench Highlights

### Initialization

```verilog
force dut.q = 0;
force dut.qbar = 1;
#1;
release dut.q;
release dut.qbar;
```

✔ Ensures a **known starting state**, which is essential for latch simulation.

### Test Scenarios

* Hold condition
* Set operation
* Reset operation
* Toggle mode
* Enable disabled behavior

## Simulation Steps

1. Open a Verilog simulator (ModelSim / Vivado / Icarus)
2. Compile:

   * `jk_latch_nand.v`
   * `tb_jk_latch_nand.v`
3. Run simulation
4. Observe console output or waveform

##  Sample Simulation Output

time=0  en=0 j=0 k=0 q=0 qbar=1
time=10 en=1 j=1 k=0 q=1 qbar=0
time=20 en=1 j=0 k=0 q=1 qbar=0
time=30 en=1 j=0 k=1 q=0 qbar=1
time=40 en=1 j=0 k=0 q=0 qbar=1
time=50 en=1 j=1 k=1 q=1 qbar=0

