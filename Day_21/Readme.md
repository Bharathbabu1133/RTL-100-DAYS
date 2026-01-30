## What is a Synchronous Reset?

A **synchronous reset** resets the flip-flop **only at the active clock edge**.
Unlike an asynchronous reset, changes in `rst` **do not affect the output immediately**.
The reset takes effect **only when the clock edge occurs**.

In this design, the reset is applied on the **negative edge of the clock**.

---

## Operation

| Clock Edge | Reset (rst) | D (8-bit) | Q (8-bit)        |
| ---------- | ----------- | --------- | ---------------- |
| ↓ CLK      | 1           | X         | 00110100 (8'h34) |
| ↓ CLK      | 0           | d         | d                |
| No edge    | X           | X         | Hold             |

---

## Module Details

### Module Name

`dff_8_sync_reset_neg`

### Inputs

* `clk` → Clock (**negative edge triggered**)
* `rst` → Synchronous reset (**active high**)
* `d [7:0]` → 8-bit data input

### Output

* `q [7:0]` → 8-bit stored output

---

## RTL Logic Explanation

```verilog
always @(negedge clk) begin
    if (rst)
        q <= 8'h34;
    else
        q <= d;
end
```

* Reset is checked **inside the clocked always block**
* Output resets **only on the negative edge of the clock**
* Reset value is **8'h34**
* Uses **non-blocking assignment (`<=`)**, which is recommended for sequential logic

---

## Testbench (`tb_dff_8_sync_reset_neg`)

### Clock Generation

```verilog
forever #5 clk = ~clk;
```

✔ Generates a **10 ns clock period**

---

### Test Sequence

* Reset asserted at the beginning
* Data patterns applied:

  * `00`
  * `AA`
  * `55`
  * `FF`
* Reset asserted again during normal operation
* Reset de-asserted and data resumes

---

### Monitoring

```verilog
$monitor("time=%0t clk=%b rst=%b d=%h q=%h",
          $time, clk, rst, d, q);
```

✔ Displays real-time signal changes during simulation

---

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `dff_8_sync_reset_neg.v`
   * `tb_dff_8_sync_reset_neg.v`
3. Run the simulation
4. Observe waveform or console output

---

## Sample Simulation Output

```
time=0  clk=0 rst=1 d=00 q=34
time=10 clk=1 rst=0 d=00 q=34
time=20 clk=0 rst=0 d=AA q=AA
time=30 clk=0 rst=0 d=55 q=55
time=40 clk=0 rst=1 d=55 q=34
time=50 clk=0 rst=0 d=FF q=FF

