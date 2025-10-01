library(tidyverse)

# 1 define the possible outcomes
foo <- tibble(
  x = seq(0, 100, length.out = 100)
)
#2 Choose our parameters
mu <- 45
sigma <- 16

#3. Calculate density
foo <- mutate(foo, density = dnorm(x, mean = mu, sd = sigma))

#4. Plot it 
ggplot(foo, aes(x, density))+
  geom_line()

#EXPLORING dpois() to 
# 1 define the possible outcomes
foo <- tibble(
  x = seq(0, 20, by = 1)
)
#2 Choose our parameters
# As lambda goes up probability of the outcome goes up
lambda <- 5

#3. Calculate mass
foo <- mutate(foo, mass = dpois(x, lambda = lambda, log = FALSE))

#4. Plot it 
ggplot(foo, aes(x, mass))+
  geom_line()

#EXPLORING dgamma() to 
# 1 define the possible outcomes
foo <- tibble(
  x = seq(0, 10, by = 0.1)
)
#2 Choose our parameters
# As lambda goes up probability of the outcome goes up
shape <- 4
rate <- 1

#3. Calculate density
foo <- mutate(foo, density = dgamma(x, shape = shape, rate = rate))

#4. Plot it 
ggplot(foo, aes(x, density))+
  geom_line()

