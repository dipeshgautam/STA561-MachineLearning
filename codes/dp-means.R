dp.means <- function(data, lambda = 1, max.iterations = 100, tolerance = 10e-3)
{
  n <- nrow(data)
  k <- 1
  assignments <- rep(1, n)
  mu.x1 <- mean(data$x1)
  mu.x2 <- mean(data$x2)
  mu.x3 <- mean(data$x3)
  mu.x4 <- mean(data$x4)
  mu.x5 <- mean(data$x5)
  mu.x6 <- mean(data$x6)
  mu.x7 <- mean(data$x7)
  mu.x8 <- mean(data$x8)
  mu.x9 <- mean(data$x9)
  mu.x10 <- mean(data$x10)
  mu.x11 <- mean(data$x11)
  mu.x12 <- mean(data$x12)
  mu.x13 <- mean(data$x13)
  mu.x14 <- mean(data$x14)
  
  converged <- FALSE
  iteration <- 0
  
  ss.old <- Inf
  ss.new <- Inf
  
  while (!converged && iteration < max.iterations)
  {
    iteration <- iteration + 1
    
    for (i in 1:n)
    {
      distances <- rep(NA, k)
      
      for (j in 1:k)
      {
        distances[j] <- (data[i, 'x1'] - mu.x1[j])^2 + (data[i, 'x2'] - mu.x2[j])^2 
        + (data[i, 'x3'] - mu.x3[j])^2 + (data[i, 'x4'] - mu.x4[j])^2 + (data[i, 'x5'] - mu.x5[j])^2 
        + (data[i, 'x6'] - mu.x6[j])^2 + (data[i, 'x7'] - mu.x7[j])^2 + (data[i, 'x8'] - mu.x8[j])^2 
        + (data[i, 'x9'] - mu.x9[j])^2 + (data[i, 'x10'] - mu.x10[j])^2 + (data[i, 'x11'] - mu.x11[j])^2
        + (data[i, 'x12'] - mu.x12[j])^2 + (data[i, 'x13'] - mu.x13[j])^2 + (data[i, 'x14'] - mu.x14[j])^2
      }
      
      if (min(distances) > lambda)
      {
        k <- k + 1
        assignments[i] <- k
        mu.x1[k] <- data[i, 'x1']
        mu.x2[k] <- data[i, 'x2']
        mu.x3[k] <- data[i, 'x3']
        mu.x4[k] <- data[i, 'x4']
        mu.x5[k] <- data[i, 'x5']
        mu.x6[k] <- data[i, 'x6']
        mu.x7[k] <- data[i, 'x7']
        mu.x8[k] <- data[i, 'x8']
        mu.x9[k] <- data[i, 'x9']
        mu.x10[k] <- data[i, 'x10']
        mu.x11[k] <- data[i, 'x11']
        mu.x12[k] <- data[i, 'x12']
        mu.x13[k] <- data[i, 'x13']
        mu.x14[k] <- data[i, 'x14']            
      } else
      {
        assignments[i] <- which(distances == min(distances))
      }
    }
    
    for (j in 1:k)
    {
      if (length(assignments == j) > 0)
      {
        mu.x1[j] <- mean(data[assignments == j, 'x1'])
        mu.x2[j] <- mean(data[assignments == j, 'x2'])
        mu.x3[j] <- mean(data[assignments == j, 'x3'])
        mu.x4[j] <- mean(data[assignments == j, 'x4'])
        mu.x5[j] <- mean(data[assignments == j, 'x5'])
        mu.x6[j] <- mean(data[assignments == j, 'x6'])
        mu.x7[j] <- mean(data[assignments == j, 'x7'])
        mu.x8[j] <- mean(data[assignments == j, 'x8'])
        mu.x9[j] <- mean(data[assignments == j, 'x9'])
        mu.x10[j] <- mean(data[assignments == j, 'x10'])
        mu.x11[j] <- mean(data[assignments == j, 'x11'])
        mu.x12[j] <- mean(data[assignments == j, 'x12'])
        mu.x13[j] <- mean(data[assignments == j, 'x13'])
        mu.x14[j] <- mean(data[assignments == j, 'x14'])
      }
    }
    
    ss.new <- 0
    
    for (i in 1:n)
    {
      ss.new <- ss.new + (data[i, 'x1'] - mu.x1[assignments[i]])^2 + (data[i, 'x2'] - mu.x2[assignments[i]])^2
      + (data[i, 'x3'] - mu.x3[assignments[i]])^2 + (data[i, 'x4'] - mu.x4[assignments[i]])^2
      + (data[i, 'x5'] - mu.x5[assignments[i]])^2 + (data[i, 'x6'] - mu.x6[assignments[i]])^2
      + (data[i, 'x7'] - mu.x7[assignments[i]])^2 + (data[i, 'x8'] - mu.x8[assignments[i]])^2
      + (data[i, 'x9'] - mu.x9[assignments[i]])^2 + (data[i, 'x10'] - mu.x10[assignments[i]])^2
      + (data[i, 'x11'] - mu.x11[assignments[i]])^2 + (data[i, 'x12'] - mu.x12[assignments[i]])^2
      + (data[i, 'x13'] - mu.x13[assignments[i]])^2 + (data[i, 'x14'] - mu.x14[assignments[i]])^2
    }
    
    ss.change <- ss.old - ss.new
    ss.old <- ss.new
    
    if (!is.nan(ss.change) && ss.change < tolerance)
    {
      converged <- TRUE
    }
  }
  
  centers <- data.frame(x1 = mu.x1, x2 = mu.x2, x3 = mu.x3, x4 = mu.x4, x5 = mu.x5, x6 = mu.x6
                        , x7 = mu.x7, x8 = mu.x8, x9 = mu.x9, x10 = mu.x10, x11 = mu.x11, x12 = mu.x12
                        , x13 = mu.x13, x14 = mu.x14)
  
  return(list("centers" = centers, "assignments" = factor(assignments), "k" = k, "iterations" = iteration))
}
