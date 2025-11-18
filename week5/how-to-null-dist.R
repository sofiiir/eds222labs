# Hypothesis test _> starting from the null distribution 
# H0 assumes NO DIFFERENCE between p_hat1 and p_hat2
# If there's no difference, toss them all in the same bag

# Let's simulate what a null distribution looks like
p <- 0.5
n1 <- 600 
n2 <- 400 

# Simpulate samples from that null distribution 
n_samples <- 1e4
x1 <- rbinom(n = n_samples,
             size = n1, 
             prob = p)
x2 <- rbinom(n = n_samples,
             size = n2, 
             prob = p)

# Calculate statistic for each sample
p1_hat <- x1/n1
p2_hat <- x2/n2
diff_prop <- p2_hat - p1_hat

# standard error for the null hypothsis
# SE(p_hat)
p_hat <- (x1 + x2)/ (n1+ n2)
hist(p_hat)

se_null <- sqrt(p_hat *(1 - p_hat) * (1/n1 + 1/n2))

# pnorm() is the are under the curve
# why is mean = 0?
# The mean is zero because we're t
# why is sd = se_null? by definition
# why is te first argument = diff_prop? 
# We're trying to find how much of this tail falls to the right of the diff_prop line
pval <- pnorm(diff_prop, mean = 0, sd = se_null, lower.tail = FALSE)
