## What is an Asynchronous Reset?

An **asynchronous reset** resets the flip-flop **immediately when the reset signal is asserted**, independent of the clock.
Unlike a synchronous reset, the output changes **as soon as `rst` goes high**, without waiting for a clock edge.

---

## Operation

| Clock   | Reset (rst) | D (8-bit) | Q (8-bit) |
| ------- | ----------- | --------- | --------- |
| X       | 1           | X         | 00000000  |
| ↑ CLK   | 0           | d         | d         |
| No edge | 0           | X         | Hold      |

---

## Module Details

### Module Name

`dff_8_async_reset`

### Inputs

* `clk` → Clock (**positive edge triggered**)
* `rst` → Asynchronous reset (**active high**)
* `d [7:0]` → 8-bit data input

### Output

* `q [7:0]` → 8-bit stored output

---

## RTL Logic Explanation

```verilog
always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 8'b00000000;
    else
        q <= d;
end
```

* Reset is included in the **sensitivity list**
* Output resets **immediately when `rst` goes high**
* Reset does **not depend on the clock**
* Uses **non-blocking assignment (`<=`)** for proper sequential behavior

---

## Testbench (`tb_dff_8_async_reset`)

### Clock Generation

```verilog
forever #5 clk = ~clk;
```

✔ Generates a **10 ns clock period**

---

### Test Sequence

* Reset asserted at the start of simulation
* Reset de-asserted to allow data capture
* Data patterns applied:

  * `00`
  * `AA`
  * `55`
  * `FF`
* Reset asserted again during normal operation to verify asynchronous behavior

---

### Monitoring

```verilog
$monitor("time=%0t clk=%b rst=%b d=%h q=%h",
          $time, clk, rst, d, q);
```

✔ Displays signal changes in real time

---

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `dff_8_async_reset.v`
   * `tb_dff_8_async_reset.v`
3. Run the simulation
4. Observe waveform or console output

---

## Sample Simulation Output

```
time=0  rst=1 d=00 q=00
time=10 rst=0 d=00 q=00
time=20 rst=0 d=AA q=AA
time=30 rst=0 d=55 q=55
time=35 rst=1 d=55 q=00
time=40 rst=0 d=FF q=FF


