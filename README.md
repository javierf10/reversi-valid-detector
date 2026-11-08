# Reversi Board Valid Moves Hardware Detector

![VHDL](https://img.shields.io/badge/VHDL-00599C?style=for-the-badge&logo=vhdl&logoColor=white)

This repository contains the hardware design of a parallel combinational accelerator developed in VHDL that detects valid moves for black pieces on a Reversi board.

---

## Project Overview

Designing a full board processor directly is complex. This project solves the problem by employing an iterative network of basic cells that evaluate piece sequences across all 8 spatial directions in parallel.

### Key Architecture Features:
* **Fully Combinational:** Processes the entire Reversi board state simultaneously without requiring clock cycles.
* **Hierarchical Modular Design:**
  * **Basic Cell (`CELDA_BASE`):** Smallest unit in the iterative network. Checks contiguous board positions along a single direction vector.
  * **Macro Cell (`MACRO_CELDA`):** Aggregates 8 basic cells to evaluate valid moves across all 8 possible directions for a single board position.
  * **Cell Matrix (`matriz_celdas`):** Integrates the macro-cells into an $8 \times 8$ grid to yield full-board parallel valid move detection.

---

## Repository Structure

* `src/CELDA_BASE.vhd`: Directional basic cell logic for iterative evaluation.
* `src/MACRO_CELDA.vhd`: 8-direction macro-cell wrapper for a single board tile.
* `src/matriz_celdas.vhd`: Top-level matrix integrating macro-cells across the whole board.
* `tb/test_microcelda.vhd`: Testbench for validating basic cell functionality.
* `tb/test_macrocelda.vhd`: Testbench for testing directional macro-cells.
* `tb/sim_matrix.vhd`: Testbench for full board matrix verification.

---

## Simulation & Verification

1. Compile the design files in **ModelSim / QuestaSim**:
```bash
   vlib work
   vcom src/*.vhd tb/*.vhd
```
2. Run the matrix simulation testbench:
   ```bash
   vsim work.sim_matrix
   ```

   
