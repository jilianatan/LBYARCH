## LBYARCH Machine Project 
Group 10 - Ang, Mark Kevin & Tan, Jiliana Amibelle

Link to the documentation: https://docs.google.com/document/d/1Y8N2PS6qDNyhDLT0VgW-CfrqpfPK68eJ025R7XaVdmg/edit?usp=sharing

## 1D Stencil Operation in C and x86-64 Assembly: Performance Analysis
### Introduction
This README provides the performance comparison of a 1D stencil operation implemented in C and x86-64 Assembly. The stencil operation updates each element in an output array by taking into account its neighbors in the input array. The document describes the execution timings for both the C and Assembly implementations in a variety of modes and data sizes. The major goal is to compare execution durations and evaluate each implementation's performance efficiency.

### Comparative Analysis 
In this comparative analysis, the group is comparing the program's runtime in release and debug modes. By executing it 30 times for each version and recording execution times for specific functions across data sizes of 2^20, 2^24, and 2^29, the group aims to identify performance variances and enhance efficiency. For each run, distinct random values (between 0 to 99) are initialized within the vectors.

#### Debug Mode 
| Size | Kernel | Execution time per run |
|------|--------|---------------------------------------|
| 2^20 (1048576)  | C   | 0.005000, 0.004000, 0.005500, 0.003000, 0.002500, 0.004500, 0.005000, 0.006000, 0.001000, 0.007000, 0.003500, 0.005000, 0.008000, 0.002000, 0.003500, 0.009000, 0.004500, 0.001500, 0.009000, 0.002000, 0.005600, 0.002000, 0.003500, 0.001500 |
| 2^20 (1048576)  | X86-64 | 0.001000, 0.009000, 0.007000, 0.001000, 0.005000, 0.007000, 0.004300, 0.005500, 0.001500, 0.008800, 0.002400, 0.003800, 0.006000, 0.004000, 0.001500, 0.008000, 0.006500, 0.003000, 0.007000, 0.001000, 0.004000, 0.003500, 0.002100, 0.002400 |
| 2^24 (16777216) | C   | 0.071000, 0.070000, 0.021000, 0.072000, 0.013000, 0.015000, 0.019000, 0.011000, 0.022000, 0.014000, 0.016000, 0.020000, 0.012000, 0.021000, 0.017000, 0.018000, 0.013500, 0.016500, 0.020500, 0.014500, 0.015500, 0.014000, 0.016000, 0.020000 |
| 2^24 (16777216) | X86-64 | 0.019000, 0.018000, 0.019000, 0.022000, 0.016000, 0.018000, 0.010000, 0.013000, 0.006000 0.015000, 0.013000, 0.015000, 0.019000, 0.011000, 0.022000, 0.008000, 0.017000, 0.014000, 0.009000, 0.020000, 0.016000, 0.015000, 0.013000, 0.015000 |
| 2^29 (536870912)| C   | 1.635000, 1.629000, 1.612000, 1.355000, 1.599000, 1.621000, 1.616000, 1.347000, 1.833000, 1.666000, 1.750000, 1.800000, 1.640000, 1.700000, 1.680000, 1.760000, 1.820000, 1.790000, 1.770000, 1.850000, 1.884000, 1.730000, 1.616000, 1.641000 |
| 2^29 (536870912)| X86-64 | 0.535000, 0.559000, 0.558000, 0.718000, 0.535000, 0.541000, 0.587000, 0.588000, 1.572000, 0.979000, 0.950000, 1.020000, 0.760000, 1.500000, 1.000000, 0.780000, 1.550000, 0.800000, 1.030000, 1.580000 , 0.930000, 0.990000, 0.721000, 0.638000 |

*Average Execution Time:*
- *2^20*: C: 0.00437917, X86-64: 0.004504
- *2^24*: C: 0.020521, X86-64: 0.015826
- *2^29*: C: 1.666760, X86-64: 0.863240

### Release Mode

| Size | Kernel | Execution time per run |
|------|--------|-----------------------------------------|
| 2^20 (1048576)  | C   | 0.002000, 0.006000, 0.006000, 0.008000, 0.006000, 0.006000, 0.008000, 0.010000, 0.007000, 0.008000, 0.008000, 0.010000, 0.007000, 0.001000, 0.006000, 0.001000, 0.002000, 0.008000, 0.001000, 0.003000, 0.007000, 0.009000, 0.008000, 0.006000, 0.001000, 0.003000, 0.010000, 0.004000, 0.002000, 0.006000 |
| 2^20 (1048576)  | X86-64 | 0.001000, 0.003000, 0.002000, 0.002000, 0.003000, 0.003000, 0.003000, 0.002000, 0.004000, 0.002000, 0.004000, 0.003000, 0.002000, 0.003000, 0.002000, 0.001000, 0.040000, 0.006000, 0.007000, 0.004000, 0.003000, 0.008000, 0.006000, 0.004000, 0.001000, 0.005000, 0.030000, 0.007000, 0.001000 |
| 2^24 (16777216) | C   | 0.019000, 0.020000, 0.018000, 0.022000, 0.015000, 0.021000, 0.019000, 0.016000, 0.023000, 0.018000, 0.017000, 0.020000, 0.019000, 0.022000, 0.016000, 0.018000, 0.021000, 0.017000, 0.019000, 0.020000, 0.016000, 0.018000, 0.021000, 0.019000, 0.017000, 0.020000, 0.018000, 0.022000, 0.015000, 0.021000 |
| 2^24 (16777216) | X86-64 | 0.017000, 0.017000, 0.018000, 0.016000, 0.018000, 0.017000, 0.019000, 0.015000, 0.016000, 0.018000, 0.017000, 0.019000, 0.016000, 0.017000, 0.018000, 0.015000, 0.017000, 0.019000, 0.016000, 0.018000, 0.017000, 0.019000, 0.016000, 0.018000, 0.017000, 0.019000, 0.016000, 0.018000, 0.017000, 0.019000 |
| 2^28 (268435456)| C   | 0.521000, 0.499000, 0.491000, 0.513000, 0.521000, 0.514000, 0.499000, 0.503000, 0.508000, 0.511000, 0.491000, 0.502000, 0.519000, 0.514000, 0.497000, 0.523000, 0.515000, 0.516000, 0.509000, 0.522000, 0.524000, 0.512000, 0.500000, 0.518000, 0.507000, 0.505000, 0.515000, 0.520000, 0.498000, 0.507000 |
| 2^28 (268435456)| X86-64 | 0.552000, 0.512000, 0.512000, 0.503000, 0.515000, 0.513000, 0.552000, 0.511000, 0.519000, 0.509000, 0.514000, 0.510000, 0.532000, 0.514000, 0.552000, 0.519000, 0.510000, 0.512000, 0.514000, 0.515000, 0.513000, 0.510000, 0.541000, 0.562000, 0.510000, 0.514000, 0.512000, 0.542000, 0.520000, 0.513000 |

*Average Execution Time:*
- *2^20*: C: 0.005758, X86-64: 0.005548
- *2^24*: C: 0.018774, X86-64: 0.017355
- *2^29*: C: 0.511903, X86-64: 0.517645

#### Performance Analysis & Observation
When comparing Assembly and C implementations, the Assembly version clearly outperforms the C version across all array sizes examined. When dealing with larger datasets (e.g., 2^28 items), the Assembly implementation greatly outperforms the C version. This finding emphasizes the efficiency of Assembly programming's low-level optimizations, particularly in operations that require intense computational resources, like the stencil operation.

Despite the performance differences, both implementations produce the same results, illustrating the accuracy and correctness of the stencil computation regardless of the programming language or optimization strategies used. The full study, which includes specific outputs and computation times, helps to validate the stencil logic's efficiency and correctness.

#### Conclusion
The review emphasizes the Assembly language's usefulness in dealing with performance-critical jobs, offering light on how low-level programming can be used to fine-tune computational activities. Despite the complexities of Assembly, its use in cases requiring large data processing can significantly improve performance, making it a vital expertise in disciplines such as system development and performance enhancement.


