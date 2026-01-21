### What is a Synchronous Reset?

A **synchronous reset** resets the flip-flop **only at the rising edge of the clock**.
Unlike asynchronous reset, changes in `rst` **do not affect the output immediately**.

## Operation

| Clock Edge | Reset (`rst`) | D (8-bit) | Q (8-bit)  |
| ---------- | ------------- | --------- | ---------- |
| ↑ CLK      | 1             | X         | `00000000` |
| ↑ CLK      | 0             | `d`       | `d`        |
| No edge    | X             | X         | Hold       |

## Module Details

### Module Name

`dff_8_sync_reset`

### Inputs

* `clk` → Clock (positive edge triggered)
* `rst` → Synchronous reset (active high)
* `d [7:0]` → 8-bit data input

### Output

* `q [7:0]` → 8-bit stored output

## RTL Logic Explanation

```verilog
always @(posedge clk) begin
    if (rst)
        q <= 8'b00000000;
    else
        q <= d;
end
```

* Reset is checked **inside the clocked always block**
* Output resets only on **clock edge**
* Uses **non-blocking assignment (`<=`)** for sequential logic

## Testbench (`tb_dff_8_async_reset`)

### Clock Generation

```verilog
forever #5 clk = ~clk;
```

✔ Generates a **10 ns clock period**

### Test Sequence

* Reset asserted at start
* Data patterns applied:

  * `00`
  * `AA`
  * `55`
  * `FF`
* Reset asserted again during operation

### Monitoring

```verilog
$monitor("time=%0t rst=%b d=%h q=%h", $time, rst, d, q);
```

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `dff_8_sync_reset.v`
   * `tb_dff_8_async_reset.v`
3. Run simulation
4. Observe waveform or console output

## Sample Simulation Output

time=0   rst=1 d=00 q=00
time=10  rst=0 d=00 q=00
time=20  rst=0 d=AA q=AA
time=30  rst=0 d=55 q=55
time=40  rst=1 d=55 q=00
time=50  rst=0 d=FF q=FF

