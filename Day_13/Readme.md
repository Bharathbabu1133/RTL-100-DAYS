### What is an SR Latch?

An **SR latch** is a bistable sequential circuit made using **cross-coupled logic gates**.
It has two inputs:

* **Set (S)**
* **Reset (R)**

In a **NAND-based SR latch**, the inputs are **active-low**:

* `s_n = 0` → Set
* `r_n = 0` → Reset

## NAND-based SR Latch Behavior

| S̅ | R̅ | Q (Next State) | Description     |
| -- | -- | -------------- | --------------- |
| 1  | 1  | Hold           | No change       |
| 0  | 1  | 1              | Set             |
| 1  | 0  | 0              | Reset           |
| 0  | 0  | Invalid        | Forbidden state |

## Module Details

### Module Name

`sr_latch_nand`

### Inputs

* `s_n` → Active-low Set
* `r_n` → Active-low Reset

### Outputs

* `q`    → Normal output
* `qbar` → Complement of `q`

### Modeling Style

* **Dataflow modeling**
* Uses **cross-coupled NAND logic**

##  RTL Logic Explanation

verilog
assign q    = ~(s_n & qbar);
assign qbar = ~(r_n & q);

* Outputs are **fed back** to inputs
* This feedback enables **memory (storage)**
* Change in state happens **immediately** based on inputs


##  Testbench (`tb_sr_latch_nand`)

The testbench:

* Applies all valid and invalid input combinations
* Uses `$monitor` to track changes in real time
* Demonstrates **set, reset, hold, and invalid conditions**


## Simulation Steps

1. Open any Verilog simulator (ModelSim / Vivado / Icarus)
2. Compile:

   * `sr_latch_nand.v`
   * `tb_sr_latch_nand.v`
3. Run simulation
4. Observe console output or waveform

## Sample Simulation Output

time=0  s_n=1 r_n=1 q=x qbar=x
time=10 s_n=0 r_n=1 q=1 qbar=0
time=20 s_n=1 r_n=1 q=1 qbar=0
time=30 s_n=1 r_n=0 q=0 qbar=1
time=40 s_n=1 r_n=1 q=0 qbar=1
time=50 s_n=0 r_n=0 q=1 qbar=1  <-- Invalid
