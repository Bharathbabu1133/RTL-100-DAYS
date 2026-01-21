### What is an SR Flip-Flop?

An **SR Flip-Flop** has two inputs:

* **S (Set)** → Sets output `Q = 1`
* **R (Reset)** → Resets output `Q = 0`

It stores data using **cross-coupled NAND gates** and feedback.

---

## SR Flip-Flop Truth Table

| S | R | Q (Next) | Q̅ (Next) | Description |
| - | - | -------- | --------- | ----------- |
| 0 | 0 | ❌        | ❌         | Invalid     |
| 0 | 1 | 1        | 0         | Set         |
| 1 | 0 | 0        | 1         | Reset       |
| 1 | 1 | Hold     | Hold      | No change   |


##  Module Details

### Module Name

`sr_flip_flop`

### Inputs

* `s` → Set input
* `r` → Reset input

### Outputs

* `q`  → Stored output
* `qn` → Complement of `q`

### Modeling Style

* **Dataflow modeling**
* Implemented using **NAND logic**

---

## RTL Logic Explanation

```verilog
assign n1 = ~(s & qn);
assign n2 = ~(r & q);
assign q  = n1;
assign qn = n2;
```

* Cross-coupled feedback creates memory
* NAND logic controls Set and Reset
* Outputs continuously depend on each other

---

## Testbench (`tb_sr_flip_flop`)

### Test Scenarios Covered

* Initial hold condition
* Set operation
* Hold after set
* Reset operation
* Hold after reset
* Invalid input condition

### Monitoring

```verilog
$monitor("time=%0t s=%b r=%b q=%b qn=%b", $time, s, r, q, qn);
```

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `sr_flip_flop.v`
   * `tb_sr_flip_flop.v`
3. Run the simulation
4. Observe output in console or waveform viewer

##  Sample Simulation Output

time=0  s=1 r=1 q=1 qn=1
time=10 s=0 r=1 q=1 qn=0
time=20 s=1 r=1 q=1 qn=0
time=30 s=1 r=0 q=0 qn=1
time=40 s=1 r=1 q=0 qn=1
time=50 s=0 r=0 q=x qn=x

