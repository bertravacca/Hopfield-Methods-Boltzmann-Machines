In order to run a simulation, simply open main.m. and launch a simulation.

The main function inside main.m is algos_eco_dispatch.m which uses different algorithms to solve the load dispatch problem, mainly:

- projected gradient descent on the penalized objective function with relaxed binary constraints
- Hopfield method with soft and piecewise linear activation function
- Quadprog solution, that directly solves the relaxed binary constraint


Two post processes are then applied to the solution at the final iteration of all these algorithms:

- Projection for variables that need to be binary
- Supply adjustment to satisfy supply=demand. 