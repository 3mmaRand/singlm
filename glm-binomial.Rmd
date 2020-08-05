# (PART) USING `glm()` FOR BINOMIAL RESPONSES {-}

# GLM for binomial responses {#bino}

For the binomial and quasibinomial families the response can be specified in one of three ways:

As a factor: ‘success’ is interpreted as the factor not having the first level (and hence usually of having the second level).

As a numerical vector with values between 0 and 1, interpreted as the proportion of successful cases (with the total number of cases given by the weights).

As a two-column integer matrix: the first column gives the number of successes and the second the number of failures.

The quasibinomial and quasipoisson families differ from the binomial and poisson families only in that the dispersion parameter is not fixed at one, so they can model over-dispersion. For the binomial case see McCullagh and Nelder (1989, pp. 124–8). Although they show that there is (under some restrictions) a model with variance proportional to mean as in the quasi-binomial model, note that glm does not compute maximum-likelihood estimates in that model.
