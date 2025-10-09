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


# OFFICE HOURS 

# 1. Define possible outcomes
# Binomial(1, 0.5) -> 0, 1
binom_pmf <- tibble(x = c(0,1))

# 2. Choose our parameters
n <- 1
p <- 0.5

# 3. Calculate the PMF/PDF
binom_pmf <- mutate(binom_pmf,
                    pmf = dbinom(x, size = n, prob = p))
# 4. Plot it
ggplot(binom_pmf, aes(x, pmf)) +
  geom_point(size = 3) +
  theme_classic()

# 1. Define possible outcomes
# Binomial(10, 0.4) -> 0, 1
# tibble is tidyverses version of a dataframe
# tibble(x = 0:10) is the same as x = seq(0, 10, by = 1)
binom_pmf <- tibble(x = 0:10)

# 2. Choose our parameters
n <- 10
p <- 0.4

# 3. Calculate the PMF/PDF
binom_pmf <- mutate(binom_pmf,
                    pmf = dbinom(x, size = n, prob = p))
# 4. Plot it
ggplot(binom_pmf, aes(x, pmf)) +
  geom_point(size = 3) +
  theme_classic()

# 1. Define possible outcomes
# Binomial(10, 0.4) -> 0, 1
normal_pdf <- tibble(x = seq(-3, 3, length.out = 100))

# 2. Choose our parameters
mu <- 0
sigma <- 1

# 3. Calculate the PMF/PDF
normal_pdf <- mutate(normal_pdf,
                    pdf = dnorm(x, mean = mu, sd = sigma))
# 4. Plot it
ggplot(normal_pdf, aes(x, pdf)) +
  geom_line(linewidth = 2) +
  geom_point(data = slice(normal_pdf, 50),
             color = "hotpink", size = 3)+
  theme_classic()

# Finding the area under the curve
pnorm(-2, mean = mu, sd = sigma)

# BETA 
# 1. Define possible outcomes
# Beta(0, 7)
beta_pdf <- tibble(x = seq(0, 1, length.out = 100))

# 2. Choose our parameters
a <- 2
b <- 7

# 3. Calculate the PMF/PDF
beta_pdf <- mutate(beta_pdf,
                     pdf = dbeta(x, shape1 = a, shape2 = b))
# 4. Plot it
ggplot(beta_pdf, aes(x, pdf)) +
  geom_line(linewidth = 2) +
  theme_classic()
