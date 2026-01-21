##  What is a Comparator?

A **comparator** is a combinational circuit that compares two binary numbers and produces an output indicating their relationship:

* Greater than (`>`)
* Less than (`<`)
* Equal to (`==`)

## Design Details

### Module: `comparator_8bit`

**Modeling Style:** Dataflow (continuous assignment)

### Inputs

* `A [7:0]` → First 8-bit number
* `B [7:0]` → Second 8-bit number

### Output

* `out [2:0]` → Comparison result

##  Output Encoding

| Condition         | `out` |
| ----------------- | ----- |
| `A > B`           | `011` |
| `A < B`           | `010` |
| `A == B`          | `001` |
| Invalid / default | `000` |

> Only **one condition is true at a time**, so only one encoding is active.

## 🧪 Testbench (`tb_8bit_comparator`)

The testbench:

* Applies different values to `A` and `B`
* Checks all comparison cases
* Displays outputs using `$monitor`

### Test Cases Covered

| A   | B   | Expected Output |
| --- | --- | --------------- |
| 25  | 10  | A > B → `011`   |
| 5   | 20  | A < B → `010`   |
| 15  | 15  | A == B → `001`  |
| 255 | 0   | A > B → `011`   |
| 0   | 255 | A < B → `010`   |


##  How to Simulate

1. Open a Verilog simulator:

   * ModelSim
   * Vivado
   * Icarus Verilog
2. Compile:

   * `comparator_8bit.v`
   * `tb_8bit_comparator.v`
3. Run the simulation
4. Observe the console output or waveform

## Sample Simulation Output

Time=0  | A=25  | B=10  | out=011
Time=10 | A=5   | B=20  | out=010
Time=20 | A=15  | B=15  | out=001
Time=30 | A=255 | B=0   | out=011
Time=40 | A=0   | B=255 | out=010


