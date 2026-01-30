## What is Byte Enable?

**Byte enable** allows selective updating of specific byte(s) in a multi-byte register.
Instead of writing the entire 16-bit data at once, individual bytes can be updated based on control signals.

This design supports **two byte enables**:

* Lower byte → `q[7:0]`
* Upper byte → `q[15:8]`

---

## Operation

| Clock Edge | resetn | byteena | D (16-bit) | Q (16-bit)        |
| ---------- | ------ | ------- | ---------- | ----------------- |
| ↑ CLK      | 0      | XX      | X          | 0000              |
| ↑ CLK      | 1      | 00      | d          | Hold              |
| ↑ CLK      | 1      | 01      | d          | Update lower byte |
| ↑ CLK      | 1      | 10      | d          | Update upper byte |
| ↑ CLK      | 1      | 11      | d          | Update both bytes |

---

## Module Details

### Module Name

`dff_16_byteena`

### Inputs

* `clk` → Clock (**positive edge triggered**)
* `resetn` → **Active-low synchronous reset**
* `byteena [1:0]` → Byte enable control

  * `byteena[0]` → Enables lower byte (`q[7:0]`)
  * `byteena[1]` → Enables upper byte (`q[15:8]`)
* `d [15:0]` → 16-bit data input

### Output

* `q [15:0]` → 16-bit registered output

---

## RTL Logic Explanation

```verilog
always @(posedge clk) begin
    if (!resetn)
        q <= 16'b0;
    else begin
        if (byteena[0])
            q[7:0] <= d[7:0];
        if (byteena[1])
            q[15:8] <= d[15:8];
    end
end
```

* Reset is **synchronous and active-low**
* Byte-wise updates allow **partial register writes**
* If a byte enable is `0`, that byte **retains its previous value**
* Uses **non-blocking assignments (`<=`)** for sequential logic

---

## Testbench (`tb_dff_16_byteena`)

### Clock Generation

```verilog
forever #5 clk = ~clk;
```

✔ Generates a **10 ns clock period**

---

### Test Sequence

* Reset asserted initially (`resetn = 0`)
* Reset released to enable operation
* Byte-enable test cases:

  * `01` → update lower byte only
  * `10` → update upper byte only
  * `11` → update both bytes
  * `00` → hold previous value
* Reset asserted again during operation to verify reset behavior

---

### Monitoring

```verilog
$monitor("time=%0t resetn=%b byteena=%b d=%h q=%h",
          $time, resetn, byteena, d, q);
```

✔ Displays real-time signal changes during simulation

---

## How to Simulate

1. Open a Verilog simulator (ModelSim / Vivado / Icarus Verilog)
2. Compile:

   * `dff_16_byteena.v`
   * `tb_dff_16_byteena.v`
3. Run the simulation
4. Observe waveform or console output

---

## Sample Simulation Output

```
time=0  resetn=0 byteena=00 d=0000 q=0000
time=20 resetn=1 byteena=01 d=00AA q=00AA
time=30 resetn=1 byteena=10 d=BB00 q=BBAA
time=40 resetn=1 byteena=11 d=CCDD q=CCDD
time=50 resetn=1 byteena=00 d=FFFF q=CCDD
time=60 resetn=0 byteena=00 d=FFFF q=0000


