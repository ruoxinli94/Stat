# Power analysis is for calculating the required sample size of an experienment 
# given the target confidence level (alpha, 1-beta) and effect size

install.packages("pwr")
library(pwr)

# t-test:
#   t test is for comparing two means. 
#   the effect size is defined as the standardized mean difference d=(mean1 - mean2)/sigma 
#   alternative = "two.side" is the default
pwr.t.test(#n= ,
  d= ,sig.level = , power = , alternative = )  

# anova:
#   for balanced one-way ANOVA: pwr.anova.test() within which the effect size f = sqrt(sum(ni/N * (meani - mean)^2)/sigma^2)
pwr.anova.test(#n = ,
  k= ,f= ,sig.level = ,power= )

# Correlation:
#   study the difference of the correlation of two variables 
#   alternative = "two.side" is the default
pwr.r.test(#n = ,
  r= ,sig.level = ,power = , alternative = )

# linear model:
#   when assessing impacts of only one set of variables: f2 = R^2/(1-R^2)
#   when assessing impacts of a set of variables beyond another set of variables: f2 = (Rab^2-Ra^2)/(1-Rab^2)
#   u --> numerator degree of freedom
#   v --> denominator degree of freedom = N-k-1
pwr.f2.test(#v = ,
  u= , f2 = ,sig.level = , power = )   

# test of proportions:
#   compare two proportions. effect size calculated by h = ES.h(p1,p2) = 2*arcsin(sqrt(p1)) - 2*arcsin(sqrt(p2))
pwr.2p.test(#n = ,
  h=ES.h(p1,p2), sig.level = , power = , alternative = )

# Chi-square tests:
#   test if two categorical variables are related or not.
#   effect size w = ES.w2(P) = sqrt(sum((p_h0_i - p_h1_i)^2/p_h0_i)).
#   P is a hypothesized two-way probability table (contigency table).
#   degree of freedom = (m - 1) * (n -1)   m -- column in the contigency table; n -- row in the contigency table
pwr.chisq.test(#n = ,
  w = ES.w2(prob.matrix), df = , sig.level = , power = )
