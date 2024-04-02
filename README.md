## LBYARCH Machine Project 
Group 10 - Ang, Mark Kevin & Tan, Jiliana Amibelle

Link to the documentation: https://docs.google.com/document/d/1Y8N2PS6qDNyhDLT0VgW-CfrqpfPK68eJ025R7XaVdmg/edit?usp=sharing

## 1D Stencil Operation in C and x86-64 Assembly: Performance Analysis
### Introduction
This README provides the performance comparison of a 1D stencil operation implemented in C and x86-64 Assembly. The stencil operation updates each element in an output array by taking into account its neighbors in the input array. The document describes the execution timings for both the C and Assembly implementations in a variety of modes and data sizes. The major goal is to compare execution durations and evaluate each implementation's performance efficiency.

### Comparative Analysis 
In this comparative analysis, the group is comparing the program's runtime in release and debug modes. By executing it 30 times for each version and recording execution times for specific functions across data sizes of 2^20, 2^24, and 2^29, the group aims to identify performance variances and enhance efficiency. For each run, distinct random values (between 0 to 99) are initialized within the vectors.

#### Debug Mode 

#### Release Mode

#### Performance Analysis & Observation
When comparing Assembly and C implementations, the Assembly version clearly outperforms the C version across all array sizes examined. When dealing with larger datasets (e.g., 2^28 items), the Assembly implementation greatly outperforms the C version. This finding emphasizes the efficiency of Assembly programming's low-level optimizations, particularly in operations that require intense computational resources, like the stencil operation.

Despite the performance differences, both implementations produce the same results, illustrating the accuracy and correctness of the stencil computation regardless of the programming language or optimization strategies used. The full study, which includes specific outputs and computation times, helps to validate the stencil logic's efficiency and correctness.

#### Conclusion
The review emphasizes the Assembly language's usefulness in dealing with performance-critical jobs, offering light on how low-level programming can be used to fine-tune computational activities. Despite the complexities of Assembly, its use in cases requiring large data processing can significantly improve performance, making it a vital expertise in disciplines such as system development and performance enhancement.


