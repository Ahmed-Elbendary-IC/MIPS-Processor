# MIPS Processor Design & Verification

A simple MIPS processor implemented using Verilog HDL and verified through simulation using ModelSim.

## 📌 Project Overview

This project implements a basic MIPS processor datapath using Verilog HDL.

The processor integrates the main components required to fetch, decode, execute, access memory, and write results back to the register file.

The design includes separate RTL modules for the processor components, along with dedicated Verilog testbenches for module-level and top-level verification.

## 🏗️ Processor Architecture

The processor consists of the following main modules:

| Module      | Description                                          |
| ----------- | ---------------------------------------------------- |
| `mips_top`  | Top-level module connecting the processor components |
| `pc_32`     | 32-bit Program Counter                               |
| `instr_mem` | Instruction Memory                                   |
| `reg_file`  | Register File                                        |
| `alu`       | Arithmetic Logic Unit                                |
| `ctrl_unit` | Control Unit and ALU Control                         |
| `sign_ext`  | Immediate Sign Extension Unit                        |
| `data_mem`  | Data Memory                                          |

### Main Datapath

```text
        ┌─────────────────┐
        │ Program Counter │
        └────────┬────────┘
                 │
                 ▼
        ┌─────────────────┐
        │ Instruction     │
        │ Memory          │
        └────────┬────────┘
                 │
                 ▼
        ┌─────────────────┐
        │  Control Unit   │
        └────────┬────────┘
                 │
        ┌────────┴────────┐
        ▼                 ▼
 ┌──────────────┐  ┌──────────────┐
 │ Register File│  │ Sign Extend  │
 └──────┬───────┘  └──────┬───────┘
        │                 │
        └────────┬────────┘
                 ▼
            ┌─────────┐
            │   ALU   │
            └────┬────┘
                 │
          ┌──────┴──────┐
          ▼             ▼
   ┌────────────┐ ┌────────────┐
   │ Data Memory│ │ Write Back │
   └────────────┘ └────────────┘
```

## ⚙️ Supported Instructions

The processor control logic supports the following instruction types:

### R-Type Instructions

* `ADD`
* `SUB`
* `AND`
* `OR`
* `XOR`
* `SLT`

### Immediate Instructions

* `ADDI`

### Memory Instructions

* `LW`
* `SW`

### Branch Instructions

* `BEQ`

## 🧩 ALU Operations

The ALU supports the following operations:

| ALU Control | Operation |
| ----------- | --------- |
| `000`       | AND       |
| `001`       | OR        |
| `010`       | ADD       |
| `110`       | SUB       |
| `011`       | XOR       |
| `111`       | SLT       |

The ALU also generates a `zero` signal used by the branch decision logic.

## 🧪 Verification

A dedicated Verilog testbench was developed for the top-level processor.

In addition, individual processor blocks were tested using separate testbenches.

The verification environment:

* Generates the clock signal.
* Applies reset to the processor.
* Executes instructions stored in instruction memory.
* Monitors processor signals during simulation.
* Checks expected register values.
* Observes ALU results and processor behavior.

## 🔬 Example Test Sequence

The instruction memory contains test instructions including:

```text
ADDI x1, x0, 5
ADDI x2, x0, 3

ADD  x3, x1, x2
SUB  x4, x1, x2
AND  x5, x1, x2
OR   x6, x1, x2
XOR  x7, x1, x2
SLT  x8, x1, x2

ADDI x5, x0, -1

SW   x1, 4(x0)
LW   x6, 4(x0)
```

### Expected Results

```text
x1 = 5
x2 = 3

ADD  → x3 = 8
SUB  → x4 = 2
AND  → x5 = 1
OR   → x6 = 7
XOR  → x7 = 6
SLT  → x8 = 0

ADDI → x5 = -1
LW   → x6 = 5
```

## 🗂️ Project Structure

```text
MIPS-Processor/
│
├── rtl/
│   ├── mips_top.v
│   ├── pc_32.v
│   ├── instr_mem.v
│   ├── reg_file.v
│   ├── alu.v
│   ├── ctrl_unit.v
│   ├── sign_ext.v
│   └── data_mem.v
│
├── tb/
│   └── MIPS processor testbenches
│
└── README.md
```

## 🛠️ Tools Used

* Verilog HDL
* ModelSim
* GitHub

## 🎯 Project Objectives

1. Implement a basic MIPS processor using Verilog HDL.
2. Connect the processor datapath and control unit.
3. Implement arithmetic and logical operations.
4. Implement immediate and memory operations.
5. Develop module-level and top-level verification testbenches.
6. Monitor processor behavior during simulation.

## 👨‍💻 Author

**Ahmed Elbendary Ramadan Elbendary**
