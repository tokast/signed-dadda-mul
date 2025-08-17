# Signed Dadda Multiplier

This project implements a 20x10 bit signed multiplier using the Dadda wire reduction scheme in Verilog. The design is tailored for high-speed performance and efficient hardware utilization.

## Features

- **Dadda Wire Reduction Scheme:** The multiplier employs the Dadda reduction scheme, which minimizes the number of half and full adders required, leading to a more efficient and faster design.
- **Baugh-Wooley Algorithm:** The Baugh-Wooley method is used for handling signed multiplication in 2's complement representation, ensuring correct results for both positive and negative inputs.
- **High-Speed Addition:** A 29-bit Brent-Kung Adder is utilized for the final reduction stage. This adder architecture is known for its logarithmic depth, which significantly reduces the critical path delay.
- **Verilog Implementation:** The design is written in Verilog, a hardware description language suitable for ASIC and FPGA synthesis.
- **Vivado Verified:** The design has been successfully verified and simulated using the Xilinx Vivado suite, confirming its functional correctness.

## Design Details

The multiplier takes two signed inputs: a 20-bit multiplicand and a 10-bit multiplier. The output is a 29-bit signed product.

The core of the design follows these steps:

1.  **Partial Product Generation:** The Baugh-Wooley algorithm is used to generate the partial products. This method elegantly handles the signs of the input numbers by modifying the last row of the partial product matrix.
2.  **Dadda Tree Reduction:** The partial products are arranged in a matrix, which is then reduced using a Dadda tree. This process involves multiple stages of carry-save adders (half and full adders) to reduce the height of the matrix until only two rows remain.
3.  **Final Addition:** The two remaining rows are summed using a high-speed Brent-Kung Adder to produce the final product.

## Tools

- **Verilog:** The hardware description language used for implementation.
- **Xilinx Vivado:** The development environment used for synthesis, simulation, and verification.

