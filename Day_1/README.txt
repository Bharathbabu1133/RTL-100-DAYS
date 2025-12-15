# DAY_01 – Signed Overflow in Verilog

## 📌 What is Signed Overflow?

**Signed overflow** occurs when the result of adding two signed numbers **cannot be represented** within the fixed number of bits available.

In **two’s complement arithmetic**, overflow happens **only when**:
- Two numbers with the **same sign** are added  
- The **result has a different sign**

---

## 🔍 Overflow Rule (Two’s Complement)

| Operand A | Operand B | Result | Overflow |
|----------|----------|--------|----------|
| + | + | − | ✅ Yes |
| − | − | + | ✅ Yes |
| + | − | any | ❌ No |
| − | + | any | ❌ No |

---

## 📘 Example Using 8-bit Signed Numbers

An 8-bit signed number ranges from: -128 to +127 

