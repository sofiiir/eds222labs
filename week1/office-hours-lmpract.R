library(tidyverse)
# Read the model description in statistical notation
# 
# Choose a set of parameters and predictor variable(s) for your simulation
# 
# Use a random variable to generate a response, based on your parameters and predictor(s)
# 
# Fit a model to your simulated data

# Check if your model's parameter estimates match what you chose
beta0 <- 68
beta1 <- 90
beta2 <- 170
beta3 <- 30
sigma <- 500

x <- seq(from = 1, to = 500, length.out = 10000)
z <- sample(x = c(0, 1), size = 10000, replace = TRUE)

mu <- (beta0 + beta1*x + beta2*z + beta3*z*x)

y <- rnorm(n= 10000, mean = mu, sd = sigma)

ggplot(tibble(x,y,z), aes(x = x, y = y, color = z))+
  geom_point()

mod <- lm(y ~ x + z + x:z, tibble(x,y,z))
sum_mod <- summary(mod)
sum_mod$sigma
