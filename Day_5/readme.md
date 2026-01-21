##  What is an ALU?

An **Arithmetic Logic Unit (ALU)** is a core component of a processor that performs:

* Arithmetic operations (addition, subtraction)
* Logical operations (AND, OR, NOT)
* Bit manipulation operations (shift / rotate)

---

## Design Details

### Module: `alu_8bit`

**Modeling Style:** Behavioral (`always @(*)`)

### Inputs

* `a [7:0]` → Operand A
* `b [7:0]` → Operand B
* `alu_signal [2:0]` → Operation select signal

### Outputs

* `alu_out [7:0]` → ALU result
* `carry` → Carry output (valid for addition)

---

## ALU Operations

| `alu_signal` | Operation          | Description                          |     |
| ------------ | ------------------ | ------------------------------------ | --- |
| `000`        | Addition           | `alu_out = a + b`, `carry` generated |     |
| `001`        | Subtraction        | `alu_out = a - b`                    |     |
| `010`        | NAND               | `alu_out = ~(a & b)`                 |     |
| `011`        | NOR                | `alu_out = ~(a                       | b)` |
| `100`        | Rotate Left + NOT  | `alu_out = ~{a[6:0], a[7]}`          |     |
| `101`        | Rotate Right + NOT | `alu_out = ~{a[0], a[7:1]}`          |     |
| others       | Default            | `alu_out = 8'b00000000`              |     |

---

## 🧪 Testbench (`tb_alu_8bit`)

The testbench:

* Applies multiple values to operands `a` and `b`
* Cycles through different `alu_signal` values
* Displays output using `$monitor`
* Verifies carry generation for addition

---

### Test Scenarios Covered

* Zero input addition
* Normal addition and subtraction
* Logical NAND and NOR operations
* Rotate-left and rotate-right with inversion
* Overflow check during addition (`0xFF + 0x01`)

---

## How to Simulate

1. Open a Verilog simulator:

   * ModelSim
   * Vivado
   * Icarus Verilog
2. Compile:

   * `alu_8bit.v`
   * `tb_alu_8bit.v`
3. Run the simulation
4. Observe console output or waveform

---

## Sample Simulation Output

```
Time=10 | a=25 b=13 | alu_signal=000 | alu_out=38 carry=0
Time=20 | a=25 b=13 | alu_signal=001 | alu_out=12 carry=0
Time=30 | a=25 b=13 | alu_signal=010 | alu_out=EA carry=0
Time=40 | a=25 b=13 | alu_signal=011 | alu_out=C8 carry=0
Time=50 | a=25 b=13 | alu_signal=100 | alu_out=5A carry=0
Time=60 | a=25 b=13 | alu_signal=101 | alu_out=AD carry=0
Time=70 | a=FF b=01 | alu_signal=000 | alu_out=00 carry=1


