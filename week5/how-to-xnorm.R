library(tidyverse)

# what's the difference between...
rnorm()
dnorm()
pnorm()
qnorm()

# rnorm() generates random numbers
random_numbers <- rnorm(100, mean = 0, sd =1)
hist(random_numbers)

# dnorm() tells you the shape of the PDF
x <- seq(-4, 4, length.out = 100)
density_x <- dnorm(x, mean = 0, sd =1)
tibble(x, density_x) |> 
  ggplot(aes(x, density_x)) +
  geom_line() +
  theme_classic()

# pnorm()
# Whats the probability of getting a random number LESS than -0.6
# Associate p-values with pnorm() applied to the null distribution
# geom_area to shade
pnorm(-0.6, mean = 0, sd = 1)

#qnorm()
# What x value correspones to 2.5% area under the curve
# Associate CIs with qnorm() applied to the sampling distribution (not under H0)
qnorm(0.025, mean = 0, sd = 1)
qnorm(0.975, mean = 0, sd = 1)

