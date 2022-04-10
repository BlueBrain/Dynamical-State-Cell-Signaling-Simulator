# Dynamical State Cell Signaling Simulator (DiSCuSS)

There are two parts to Dynamical State Cell Signaling Simulator (DiSCuSS); one part is run in Matlab and the other in NEURON.
There are 3 Matlab executable files (`.m` suffix), 1 NEURON `.hoc` file and 1 NEURON `.mod` file in the package for the Blue Brain Project's Dynamical State Cell Signaling Simulator (DiSCuSS):

```
DiSCuSS_ampl.m
DiSCuSS_time.m
DiSCuSS_both.m
DiSCuSS_control.hoc
DiSCuSS_compile.mod
```

Users are required to use relatively recent versions of Matlab (R2016a or later, and 64 bit) and NEURON (v. 7.81 or later, and 64 bit).

### Matlab run instructions

Matlab must be purchased by the user or used via institutional license (https://www.mathworks.com/products/matlab.html).
While Matlab can be run on Windows, Mac or Linux platforms, we only provide here instructions for running on Linux-based platforms.
To run the `DiSCuSS` Matlab simulation part, type the name of the `.m` file in the Matlab command window,

e.g.,

```
DiSCuSS_ampl
```

or use the command line in a terminal window if not utilizing the Matlab gui workspace (e.g., `>matlab DiSCuSS_ampl`).

Use the Matlab workspace editor or an editor of your choice to modify the ``.m` file for figure output,
parameter adjustments, or other desired changes.


### NEURON run instructions

While the `DiSCuSS` NEURON simulation part can be run on Windows, Mac or Linux platforms, we only provide here instructions for running on Linux-based platforms.

1) Download and install NEURON (https://neuron.yale.edu/neuron/).
2) Place the `DiSCuSS_control.hoc` and `DiSCuSS_compile.mod` files into a folder.
3) Type `nrnmodl` on the command line to compile the `.mod` file (note: common errors related to paths or permissions must be solved by the users, their IT administrators, or the NEURON support community).
4) Type `nrngui DiSCuSS_control.hoc` to run the simulation.
5) Users must edit the `.hoc` and `.mod` files for desired parameter changes related to receptor Kds, neurotransmitter time constants, durations as per the published work, or any other parameters the users wish to modify.
6) Users must write their own custom data analysis scripts according to their needs to analyse the `output_file.dat` that contains columns of data as described in the `DiSCuSS_control.hoc` file.


## ACKNOWLEDGEMENTS

The development of this software was supported by funding to the Blue Brain Project, a research center of the École polytechnique fédérale de Lausanne (EPFL), from the Swiss government’s ETH Board of the Swiss Federal Institutes of Technology, as well as a CRG grant from King Abdullah University of Science and Technology “KAUST-EPFL Alliance for Integrative Modeling of Brain Energy Metabolism” [OSR-2017-CRG6-3438]

Copyright (c) 2021-2022 Blue Brain Project/EPFL
