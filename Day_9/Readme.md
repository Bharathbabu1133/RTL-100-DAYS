## Why NOR is a Universal Gate?

A **universal gate** is a logic gate that can be used to implement **any Boolean function**.

Using only **NOR gates**, we can construct:

* NOT gate
* OR gate
* AND gate

This proves that **NOR alone is functionally complete**.

---

## Design Details

### Module: `nor_universal`

**Modeling Style:** Gate-Level Modeling

### Inputs

* `A` → Input A
* `B` → Input B

### Outputs

* `AND_out` → AND operation using NOR gates
* `OR_out` → OR operation using NOR gates
* `NOT_A` → NOT operation using NOR gate

---

## Logic Implementation using NOR

### NOT Gate

```
NOT A = A NOR A
```

### OR Gate

```
A OR B = (A NOR B) NOR (A NOR B)
```

### AND Gate (Using DeMorgan’s Law)

```
A AND B = (A NOR A) NOR (B NOR B)
```

---

## Testbench (`tb_universal`)

The testbench:

* Applies **all input combinations** of `A` and `B`
* Verifies AND, OR, and NOT outputs
* Compares **NAND-based** and **NOR-based** implementations
* Uses `$monitor` for real-time observation

---

## Truth Table (NOR-based Outputs)

| A | B | AND | OR | NOT A |
| - | - | --- | -- | ----- |
| 0 | 0 | 0   | 0  | 1     |
| 0 | 1 | 0   | 1  | 1     |
| 1 | 0 | 0   | 1  | 0     |
| 1 | 1 | 1   | 1  | 0     |

---

## How to Simulate

1. Open a Verilog simulator:

   * ModelSim
   * Vivado
   * Icarus Verilog
2. Compile:

   * `nor_universal.v`
   * `nand_universal.v`
   * `tb_universal.v`
3. Run the simulation
4. Observe console output or waveform results

---

## Sample Simulation Output

```
A=0 B=0 | NAND_AND=0 NAND_OR=0 NAND_NOT=1 | NOR_AND=0 NOR_OR=0 NOR_NOT=1
A=0 B=1 | NAND_AND=0 NAND_OR=1 NAND_NOT=1 | NOR_AND=0 NOR_OR=1 NOR_NOT=1
A=1 B=0 | NAND_AND=0 NAND_OR=1 NAND_NOT=0 | NOR_AND=0 NOR_OR=1 NOR_NOT=0
A=1 B=1 | NAND_AND=1 NAND_OR=1 NAND_NOT=0 | NOR_AND=1 NOR_OR=1 NOR_NOT=0

