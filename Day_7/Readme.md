## What is an Instruction Decoder?

An **instruction decoder**:

* Interprets binary instructions
* Extracts opcode and operands
* Selects registers
* Controls the ALU and write-back logic

This design uses a **single-cycle execution model**.

---

## Instruction Format (8-bit)

```
[7:4]   [3:2]   [1:0]
Opcode   SRC     DST
```

* **Opcode (4 bits)** → Operation
* **SRC (2 bits)** → Source register
* **DST (2 bits)** → Destination register

---

## Register File

The decoder contains **four 8-bit registers**:

* `R0`
* `R1`
* `R2`
* `R3`

Registers are updated on the **positive edge of the clock**.

---

##  Design Details

### Module: `instruction_decoder_8bit`

**Modeling Style:**

* Combinational logic for decoding and ALU
* Sequential logic for register write-back

### Inputs

* `clk` → Clock signal
* `rst` → Active-high reset
* `instruction [7:0]` → Encoded instruction

### Internal Components

* Opcode decoder
* Source & destination register mux
* ALU
* Register write logic

---

## Supported Instructions

| Opcode | Operation | Description       |
| ------ | --------- | ----------------- |
| `0x0`  | ADD       | DST = DST + SRC   |
| `0x1`  | SUB       | DST = DST − SRC   |
| `0x2`  | AND       | Bitwise AND       |
| `0x3`  | OR        | Bitwise OR        |
| `0x4`  | XOR       | Bitwise XOR       |
| `0x5`  | NOT       | Bitwise NOT (DST) |
| `0x6`  | SHL       | Shift left        |
| `0x7`  | SHR       | Shift right       |
| `0x8`  | INC       | Increment DST     |
| `0x9`  | DEC       | Decrement DST     |
| `0xA`  | MOV       | DST = SRC         |
| `0xB`  | CLR       | Clear DST         |
| `0xC`  | CMP       | Compare DST & SRC |
| `0xD`  | NOP       | No operation      |
| `0xE`  | SET       | Set DST = 0xFF    |
| `0xF`  | RESERVED  | Reserved          |

---

##  Testbench (`tb_instruction_decoder_8bit`)

The testbench:

* Generates clock and reset
* Initializes registers with values
* Applies multiple instructions
* Monitors opcode, source, destination, and register contents

### Features

* Uses **hierarchical access** to initialize registers
* Displays human-readable register names
* Sequentially executes instructions

---

## How to Simulate

1. Open a Verilog simulator:

   * ModelSim
   * Vivado
   * Icarus Verilog
2. Compile:

   * `instruction_decoder_8bit.v`
   * `tb_instruction_decoder_8bit.v`
3. Run the simulation
4. Observe console output and/or waveforms

---

##  Sample Simulation Output

```
T=20 OPCODE=0 SRC=R1 DST=R0 | R0=15 R1=5 R2=3 R3=2
T=30 OPCODE=1 SRC=R2 DST=R1 | R0=15 R1=2 R2=3 R3=2
T=40 OPCODE=2 SRC=R3 DST=R0 | R0=2 R1=2 R2=3 R3=2
