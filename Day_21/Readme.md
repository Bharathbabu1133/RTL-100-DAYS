## Overview

This project implements an **8-bit D Flip-Flop** that is **negative-edge triggered** and includes a **synchronous reset**. On every falling edge of the clock (`negedge clk`), the flip-flop either loads the input data or resets to a predefined value based on the reset signal.

## Design Details

* **Triggering**: Negative edge of the clock
* **Reset Type**: Synchronous reset
* **Reset Value**: `8'h34`
* **Data Width**: 8 bits

### Behavior

* When `rst = 1`, output `q` is set to `8'h34` on the **negedge of clk**
* When `rst = 0`, output `q` follows input `d` on the **negedge of clk**

## Testbench Description

The testbench verifies:

* Clock generation with a 10 ns period
* Proper reset functionality
* Correct data capture on negative clock edges
* Reset assertion during normal operation

The `$monitor` statement tracks `clk`, `rst`, `d`, and `q` throughout simulation.

## Files Included

* `dff_8_sync_reset_neg.v` – RTL design module
* `tb_dff_8_sync_reset_neg.v` – Testbench for simulation
* `README.md` – Project documentation

## Simulation

You can simulate this design using tools like:

* ModelSim
* QuestaSim
* Vivado Simulator
* Icarus Verilog
