## 📂 Repository Structure
├── mux_4to1.v        # 4:1 Multiplexer RTL design
├── tb_mux_4to1.v     # Testbench for verification
└── README.md         # Project documentation

## 🧠 What is a 4:1 Multiplexer?

A **4:1 multiplexer** selects **one of four input signals** and forwards it to a single output based on the value of the **2-bit select line**.

## 🔧 Design Details

### Module: `mux_4to1`

**Modeling Style:** Dataflow

#### Inputs

* `d [3:0]` → 4-bit data inputs
* `sel [1:0]` → 2-bit select line

#### Output

* `y` → Selected output

---

### 🔁 Selection Logic

| `sel` | Selected Input |
| ----- | -------------- |
| `00`  | `d[0]`         |
| `01`  | `d[1]`         |
| `10`  | `d[2]`         |
| `11`  | `d[3]`         |

The logic is implemented using **nested ternary (`?:`) operators**.

---

## 🧪 Testbench (`tb_mux_4to1`)

The testbench:

* Applies multiple values to input `d`
* Iterates through all select combinations (`00` → `11`)
* Displays results using `$display` and `$monitor`
* Verifies correct multiplexer behavior

---

### ✅ Test Cases

#### Case 1

```
d = 1010
```

| sel | y |
| --- | - |
| 00  | 0 |
| 01  | 1 |
| 10  | 0 |
| 11  | 1 |

#### Case 2

```
d = 0111
```

| sel | y |
| --- | - |
| 00  | 1 |
| 01  | 1 |
| 10  | 1 |
| 11  | 0 |

---

## ▶️ How to Simulate

1. Open any Verilog simulator:

   * ModelSim
   * Vivado
   * Icarus Verilog
2. Compile the files:

   * `mux_4to1.v`
   * `tb_mux_4to1.v`
3. Run the simulation
4. Observe output in console or waveform window

---

## 📈 Sample Simulation Output

```
Time   sel   d      y
0      00    1010   0
10     01    1010   1
20     10    1010   0
30     11    1010   1
```



Just tell me 😊

