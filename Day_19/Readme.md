### What is an 8-Bit D Flip-Flop?

An **8-bit D flip-flop** is essentially **eight 1-bit D flip-flops** operating in parallel and sharing a common clock.
It stores **one byte of data** and updates the output **only on the positive clock edge**.

## Operation (↑ CLK)

| Clock Edge | D (8-bit) | Q (8-bit) |
| ---------- | --------- | --------- |
| Rising ↑   | `d`       | `d`       |
| No edge    | X         | Hold      |

## Module Details

### Module Name

`dff_8`

### Inputs

* `clk` → Clock (positive edge triggered)
* `d [7:0]` → 8-bit data input

### Outputs

* `q [7:0]` → 8-bit stored output

### Modeling Style

* **Behavioral modeling**
* Edge-triggered sequential logic

## RTL Logic Explanation

```verilog
always @(posedge clk) begin
    q <= d;
end
```

* On every **rising edge of the clock**, the 8-bit input `d` is latched into `q`
* Uses **non-blocking assignment (`<=`)** for correct sequential behavior

## Testbench (`tb_dff_8`)

### Clock Generation

```verilog
forever #5 clk = ~clk;
```

✔ Generates a **10 ns clock period**

### Test Vectors Applied

* `00000000`
* `00000001`
* `00001111`
* `10101010`
* `11110000`
* `11111111`

### Monitoring

```verilog
$monitor("time=%0t d=%b q=%b", $time, d, q);
```

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `dff_8.v`
   * `tb_dff_8.v`
3. Run the simulation
4. Observe waveform or console output

## 📈 Sample Simulation Output

time=0   d=00000000 q=00000000
time=10  d=00000001 q=00000001
time=20  d=00001111 q=00001111
time=30  d=10101010 q=10101010
time=40  d=11110000 q=11110000
time=50  d=11111111 q=11111111
