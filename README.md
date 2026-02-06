# Ready–Valid Single-Stage Pipeline Register

This repository contains a simple single-stage pipeline register implemented in SystemVerilog using a standard valid/ready handshake.

## Description
- Buffers one data element between an upstream and downstream block.
- Accepts input data when `in_valid` and `in_ready` are asserted.
- Presents output data with `out_valid`.
- Correctly handles backpressure from downstream without data loss or duplication.
- Fully synthesizable and resets to a clean, empty state.

## Files
- `pipeline_reg.sv` – RTL implementation
- `tb_pipeline_reg.sv` – Testbench for functional verification
- `waveform.jpg` - Verified using Vivado behavioral simulation.

## Simulation
The waveform (waveform.jpg) shows:
- Data accepted when in_valid & in_ready
- Backpressure handling when out_ready is low
- Correct valid/ready handshake behavior

## Notes
The design demonstrates basic flow-control concepts commonly used in AXI-stream and other on-chip interconnects.

