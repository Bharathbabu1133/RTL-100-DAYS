### What is a D Flip-Flop?

A **D Flip-Flop** transfers the value of input **D** to output **Q** on the **positive edge of the clock** and holds that value until the next clock edge.

It eliminates the invalid conditions seen in SR flip-flops.

## 🔁 D Flip-Flop Truth Table (↑ CLK)

| CLK ↑   | D | Q (Next) |
| ------- | - | -------- |
| ↑       | 0 | 0        |
| ↑       | 1 | 1        |
| No edge | X | Hold     |

## Module Details

### Module Name

`d_flipflop`

### Inputs

* `d`   → Data input
* `clk` → Clock (positive edge triggered)

### Outputs

* `q`    → Stored output
* `qbar` → Complement of `q`

### Modeling Style

* **Behavioral modeling**
* Edge-triggered sequential logic

## RTL Logic Explanation

```verilog
always @(posedge clk) begin
    q <= d;
end
```

* On every **rising edge of the clock**, `q` captures the value of `d`
* Uses **non-blocking assignment (`<=`)**, which is recommended for sequential logic
* `qbar` is generated as the complement of `q`

## Testbench (`tb_d_flipflop`)

### Clock Generation

```verilog
forever #5 clk = ~clk;
```

✔ Generates a **10 ns clock period**

### Test Scenarios

* Data = 0 → stored on clock edge
* Data = 1 → stored on clock edge
* Multiple transitions of `d`
* Verification of hold behavior between clock edges

### Monitoring

```verilog
$monitor("time=%0t d=%b q=%b qbar=%b", $time, d, q, qbar);
```

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `d_flipflop.v`
   * `tb_d_flipflop.v`
3. Run simulation
4. Observe console output or waveform

## 📈 Sample Simulation Output

time=0   d=0 q=0 qbar=1
time=10  d=1 q=1 qbar=0
time=20  d=0 q=0 qbar=1
time=30  d=1 q=1 qbar=0
