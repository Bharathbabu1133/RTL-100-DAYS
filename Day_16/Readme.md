### What is a JK Flip-Flop?

A **JK Flip-Flop** is a clocked storage element with two inputs:

* **J (Set)**
* **K (Reset)**

It behaves like:

* SR flip-flop (without invalid state)
* T flip-flop when `J = K = 1`


## JK Flip-Flop Truth Table (On Rising Edge of CLK)

| J | K | Q (Next) | Operation |
| - | - | -------- | --------- |
| 0 | 0 | Q        | Hold      |
| 0 | 1 | 0        | Reset     |
| 1 | 0 | 1        | Set       |
| 1 | 1 | Q̅       | Toggle    |

## Module Details

### Module Name

`jk_flipflop`

### Inputs

* `j`   → Set input
* `k`   → Reset input
* `clk` → Clock (positive edge triggered)

### Outputs

* `q`    → Stored output
* `qbar` → Complement of `q`

### Modeling Style

* **Behavioral modeling**
* Edge-triggered sequential logic

---

## RTL Logic Explanation

```verilog
always @(posedge clk) begin
    case ({j,k})
        2'b00: q <= q;       // Hold
        2'b01: q <= 1'b0;    // Reset
        2'b10: q <= 1'b1;    // Set
        2'b11: q <= ~q;      // Toggle
    endcase
end
```

* Output updates only on **rising edge of clock**
* Non-blocking assignments (`<=`) used for sequential logic
* Toggle operation when `J = K = 1`

---

## Testbench (`tb_jk_flipflop`)

### Clock Generation

```verilog
always #5 clk = ~clk;
```

✔ Generates a **10 ns clock period**

### Test Scenarios

* Hold (`J=0, K=0`)
* Reset (`J=0, K=1`)
* Set (`J=1, K=0`)
* Toggle (`J=1, K=1`)
* Hold after toggle

### Monitoring

```verilog
$monitor("time=%0t j=%b k=%b q=%b qbar=%b", $time, j, k, q, qbar);
```

---

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `jk_flipflop.v`
   * `tb_jk_flipflop.v`
3. Run the simulation
4. Observe waveform or console output

## 📈 Sample Simulation Output

time=0   j=0 k=0 q=0 qbar=1
time=10  j=0 k=1 q=0 qbar=1
time=20  j=1 k=0 q=1 qbar=0
time=30  j=1 k=1 q=0 qbar=1
time=40  j=0 k=0 q=0 qbar=1

