# Tensor Forms of Derivatives of Matrices and PDE Applications

This repository contains MATLAB code accompanying our paper, available on arXiv:

[**"Tensor Forms of Derivatives of Matrices and their applications in the Solutions to Differential Equations"**](https://doi.org/10.48550/arXiv.2509.08429)

## Features

- Generate 6th-order sparse tensors (Example 5.1).
- Perform partial Tucker decomposition on modes (5,6).
- Build reduced operators via Galerkin projection.
- Integrate dynamical systems in reduced space (Euler scheme).
- Reconstruct full state from reduced solution.
- Includes reproducible demo (`run_listing1_demo.m`) aligned with *Listing 1* in the paper.

## Requirements

- MATLAB R2021b or later (R2022b+ recommended).
- [Tensor Toolbox for MATLAB](https://www.tensortoolbox.org/).

## Quick Start

```matlab
>> setup
>> run_listing1_demo
```

## Repository Structure

```
tensor-pde-derivatives/
├── README.md
├── LICENSE
├── CITATION.cff
├── setup.m
├── scripts/
│   ├── run_listing1_demo.m
│   └── reproduce_random_demo.m
├── src/
│   ├── gen6ordersparsetensor.m
│   ├── tucker_reduce_modes56.m
│   ├── build_reduced_operator.m
│   ├── integrate_reduced_system.m
│   ├── reconstruct_full_state.m
│   └── utils/
│       ├── check_tensor_toolbox.m
│       └── fix_rng.m
└── tests/
    ├── test_deps_and_shapes.m
    ├── test_reduction_pipeline.m
    └── test_time_integrator.m
```

## License

MIT License. See `LICENSE` file.

## Citation

If you use this code in your research, please cite our paper. You can use the information in `CITATION.cff`.

```bibtex
@misc{xu2025tensor,
      title={Tensor Forms of Derivatives of Matrices and their applications in the Solutions to Differential Equations}, 
      author={Yiran Xu and Guangbin Wang and Changqing Xu},
      year={2025},
      eprint={2509.08429},
      archivePrefix={arXiv},
      primaryClass={math.NA}
}
```
