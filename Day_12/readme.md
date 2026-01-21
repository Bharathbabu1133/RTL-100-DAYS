
### What is Gray Code?

Gray code is a binary numeral system where **two successive values differ by only one bit**, reducing glitches in digital circuits such as:

* Encoders
* Counters
* ADCs
* Communication systems

### Conversion Formula
Gray = Binary XOR (Binary >> 1)

This logic is efficiently implemented using **bitwise XOR and right shift** operations.

## Module Details

### Module Name

`binary_to_gray`

### Inputs

* `bin [3:0]` → 4-bit binary input

### Outputs

* `gray [3:0]` → 4-bit Gray code output

### Modeling Style

* **Dataflow Modeling**

## Logic Used in RTL

```verilog
assign gray = bin ^ (bin >> 1);
```

This single-line expression performs the complete binary-to-gray conversion.

## Testbench (`tb_binary_to_gray`)

The testbench:

* Applies binary values from **0 to 15**
* Uses a `for` loop for exhaustive testing
* Displays binary and corresponding Gray code using `$monitor`

## Sample Input–Output Table

| Binary | Gray |
| ------ | ---- |
| 0000   | 0000 |
| 0001   | 0001 |
| 0010   | 0011 |
| 0011   | 0010 |
| 0100   | 0110 |
| 0101   | 0111 |
| 0110   | 0101 |
| 0111   | 0100 |
| 1000   | 1100 |
| 1001   | 1101 |

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `binary_to_gray.v`
   * `tb_binary_to_gray.v`
3. Run the simulation
4. Observe console output or waveform

##  Sample Simulation Output

binary=0000 gray=0000
binary=0001 gray=0001
binary=0010 gray=0011
binary=0011 gray=0010
...
binary=1111 gray=1000
