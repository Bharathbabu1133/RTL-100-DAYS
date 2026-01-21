### What is a T Flip-Flop?

A **T Flip-Flop** changes (toggles) its output when the toggle input `T` is HIGH at the **rising edge of the clock**.

It can be derived from a JK flip-flop by setting:

```
J = K = T
```

## T Flip-Flop Truth Table (↑ CLK)

| RST | T | Q (Next) | Operation |
| --- | - | -------- | --------- |
| 1   | X | 0        | Reset     |
| 0   | 0 | Q        | Hold      |
| 0   | 1 | Q̅       | Toggle    |

✔ Reset has **highest priority**
✔ Reset is **asynchronous**

## Module Details

### Module Name

`t_flip_flop`

### Inputs

* `t`   → Toggle input
* `clk` → Clock (positive edge triggered)
* `rst` → Asynchronous reset (active high)

### Outputs

* `q`    → Stored output
* `qbar` → Complement of `q`

### Modeling Style

* **Behavioral modeling**
* Edge-triggered sequential logic

## RTL Logic Explanation

```verilog
always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else if (t)
        q <= ~q;
    else
        q <= q;
end
```
* Reset clears the output immediately
* When `T = 1`, output toggles on each rising edge
* When `T = 0`, output holds previous value
* Non-blocking assignments (`<=`) ensure proper sequential behavior

## Testbench Description

The testbench:

* Generates a periodic clock
* Applies reset
* Toggles `T` input
* Monitors output changes using `$monitor`

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `t_flip_flop.v`
   * `tb_t_flip_flop.v`
3. Run the simulation
4. Observe waveform or console output

## Sample Simulation Output

time=0   rst=1 t=0 q=0 qbar=1
time=10  rst=0 t=1 q=1 qbar=0
time=20  rst=0 t=1 q=0 qbar=1
time=30  rst=0 t=0 q=0 qbar=1
