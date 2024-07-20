# Project Title: 8085 Assembly Language Quick Sort

## Description
This project implements the Quick Sort algorithm for an array of numbers using the 8085 microprocessor. The program sorts an array of integers stored in memory, demonstrating fundamental sorting techniques and stack management in assembly language.

## Features
- Implements the Quick Sort algorithm.
- Uses stack-based iteration to manage recursive calls.
- Demonstrates partitioning logic in assembly language.
- Sorts an array of integers stored in memory starting from a predefined address.

## Prerequisites
- Basic understanding of 8085 microprocessor architecture.
- Familiarity with assembly language programming.
- An 8085 microprocessor emulator or development environment (e.g., GNUSim8085).

## How to Use
1. Set up the Development Environment: 
- Ensure you have an 8085 emulator like GNUSim8085 installed on your system.
2. Load the Program:
- Copy the provided assembly code into your emulator's editor.
- Assemble the code to convert it into machine code.
3. Initialize the Array:
- Place the array length at memory location 8000H.
- Store the array elements starting from memory location 8001H.
4. Run the Program:
- Execute the assembled code in the emulator.
- The program will sort the array in ascending order.
5. Verify the Results:
- Check the memory locations starting from 8001H to ensure the array is sorted.

## Important Notes
- The array length and elements must be correctly initialized in memory.
- The stack size and memory locations are configured for the 8085 microprocessor. Adjustments may be needed for different setups.
- Ensure the stack pointer is set to a safe memory area to avoid stack overflow or corruption.
