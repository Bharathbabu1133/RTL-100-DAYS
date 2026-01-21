## Concept Explanation

Decimal to binary conversion is performed by:

1. Repeatedly dividing the decimal number by **2**
2. Storing the **remainders** as binary bits
3. Continuing until the quotient becomes **0**

This logic is implemented using a `while` loop in an `always @(*)` block.

---

## Module Details

### Module Name

`decimal_to_binary`

### Inputs

* `dec [3:0]` → 4-bit decimal input (0–15)

### Outputs

* `bin [3:0]` → 4-bit binary output

### Modeling Style

* **Behavioral Modeling**

---

## Conversion Algorithm (Used in RTL)

```
while (decimal > 0)
    binary[i] = decimal % 2
    decimal = decimal / 2
    i = i + 1
```

---

## Testbench (`tb_decimal_to_binary`)

The testbench:

* Applies decimal values from **0 to 9**
* Monitors binary output using `$monitor`
* Verifies correct decimal-to-binary conversion

---

## Test Cases Covered

| Decimal | Binary |
| ------- | ------ |
| 0       | 0000   |
| 1       | 0001   |
| 2       | 0010   |
| 3       | 0011   |
| 4       | 0100   |
| 5       | 0101   |
| 6       | 0110   |
| 7       | 0111   |
| 8       | 1000   |
| 9       | 1001   |

---

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `decimal_to_binary.v`
   * `tb_decimal_to_binary.v`
3. Run the simulation
4. Observe console output or waveform

---

##  Sample Simulation Output

```
time=0  bin=0000
time=10 bin=0001
time=20 bin=0010
time=30 bin=0011
time=40 bin=0100
