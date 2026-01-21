##  What is a Carry Look-Ahead Adder?

A **Carry Look-Ahead Adder** improves speed by avoiding ripple carry delay.
It uses:

* **Propagate (P)** signals
* **Generate (G)** signals

to calculate carry outputs directly using Boolean expressions.

---

##  Design Details

### Module: `Fulladd4_with_carrylookahead`

**Modeling Style:** Dataflow / Structural

### Inputs

* `a [3:0]` → 4-bit operand A
* `b [3:0]` → 4-bit operand B
* `c_in` → Carry input

### Outputs

* `sum [3:0]` → 4-bit sum
* `c_out` → Carry output

---

##  Carry Look-Ahead Logic

### Propagate & Generate

```
Pi = ai ⊕ bi
Gi = ai & bi
```

### Carry Equations

```
c1 = g0 + (p0·cin)
c2 = g1 + (p1·g0) + (p1·p0·cin)
c3 = g2 + (p2·g1) + (p2·p1·g0) + (p2·p1·p0·cin)
c4 = g3 + (p3·g2) + (p3·p2·g1) + (p3·p2·p1·g0) + (p3·p2·p1·p0·cin)
```

### Sum Equations

```
s0 = p0 ⊕ cin
s1 = p1 ⊕ c1
s2 = p2 ⊕ c2
s3 = p3 ⊕ c3
```

---

## Testbench (`tb_Fulladd4_with_carrylookahead`)

The testbench:

* Applies multiple combinations of `a`, `b`, and `c_in`
* Verifies sum and carry outputs
* Uses `$monitor` for real-time output display

---

##  Test Cases Covered

| A    | B    | Cin | Sum  | Cout |
| ---- | ---- | --- | ---- | ---- |
| 0000 | 0000 | 0   | 0000 | 0    |
| 0011 | 0101 | 0   | 1000 | 0    |
| 1111 | 0001 | 0   | 0000 | 1    |
| 1010 | 0101 | 1   | 0000 | 1    |
| 1111 | 1111 | 1   | 1111 | 1    |

---

##  How to Simulate

1. Open a Verilog simulator:

   * ModelSim
   * Vivado
   * Icarus Verilog
2. Compile:

   * `Fulladd4_with_carrylookahead.v`
   * `tb_Fulladd4_with_carrylookahead.v`
3. Run the simulation
4. Observe results in console or waveform viewer

---

## Sample Simulation Output

```
time=10 a=0011 b=0101 cin=0 sum=1000 cout=0
time=20 a=1111 b=0001 cin=0 sum=0000 cout=1
time=30 a=1010 b=0101 cin=1 sum=0000 cout=1
