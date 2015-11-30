polya_urn_model = function(base_color_distribution, num_balls, alpha) {
  balls = c()
  
  for (i in 1:num_balls) {
    if (runif(1) < alpha / (alpha + length(balls))) {
      # Add a new ball color.
      new_color = base_color_distribution()
      balls = c(balls, new_color)
    } else {
      # Pick out a ball from the urn, and add back a
      # ball of the same color.
      ball = balls[sample(1:length(balls), 1)]
      balls = c(balls, ball)
    }
  }
  
  balls
}

polya_urn_model_plots = function(num_balls, alpha) {

  x1 = polya_urn_model(function() rnorm(1), num_balls, alpha)
  x2 = polya_urn_model(function() rnorm(1), num_balls, alpha)
  x3 = polya_urn_model(function() rnorm(1), num_balls, alpha)
  x4 = polya_urn_model(function() rnorm(1), num_balls, alpha)
  x5 = polya_urn_model(function() rnorm(1), num_balls, alpha)
  
  d1 = data.frame(x = x1, type = "run #1")
  d2 = data.frame(x = x2, type = "run #2")
  d3 = data.frame(x = x3, type = "run #3")
  d4 = data.frame(x = x4, type = "run #4")
  d5 = data.frame(x = x5, type = "run #5")
  d = rbind(d1, d2, d3, d4, d5)
  par(mfrow=c(3,1))
  pl <- qplot(x = x, data = d, geom = "density", fill = 'green', alpha = I(0.85), xlab = "Color of ball in urn", ylab = "Density", main = paste("Polya urn with gaussian colors and alpha =", alpha)) +
     facet_grid( . ~ type )
  pl + theme(legend.position="none")
}

png("polya-urn-1.png", width =600, height =200)
polya_urn_model_plots(10, 1)
dev.off()

png("polya-urn-5.png", width =600, height =200)
polya_urn_model_plots(10, 5)
dev.off()

png("polya-urn-50.png", width =600, height =200)
polya_urn_model_plots(10, 50)
dev.off()
