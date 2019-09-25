The procedure of Permutation Test, take t-test as an example
1. calculate the observed t-statistic
2. rearrage all obervations to a single group (initially two groups)
3. randomly split all observations to two groups 
4. calculate t-statistic for every possible way of the rearrangement. 
5. sort all t-statistics in an ascending list (empirical distribution)
6. place the initial t-statistic in to the empirical distribution and see if it falls outside the middle 95%. If yes, reject the null.
When the number of observations is too large to calculate each possibility of the permutation, use Monte Carlo simulation to sample permutations.

Conditions to use Permutation Test:
1. data is not normally distributed
2. has outlier impact 
3. dataset is too small

In R, the packages avaliable are: coin, lmPerm and more
