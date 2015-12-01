crp = function(num.customers, alpha) {
  table <- c(1)
  next.table <- 2
  for (i in 1:(num.customers-1)) {
    if (runif(1,0,1) < alpha / (alpha + i)) {
      # Add a new ball color.
      table <- c(table, next.table)
      next.table <- next.table+1
    } else {
      # Pick out a ball from the urn, and add back a
      # ball of the same color.
      select.table <- table[sample(1:length(table), 1)]
      table <- c(table, select.table)
    }
  }
  table
}


png("crp.png", width = 1000, height=600)
par(mfrow=c(3,1))
plot(
  table(crp(10000, 1))
 , sub="Alpha=1", ylab='', main='CRP for different alpha values', cex.main=2,
 cex.lab=1.5, col="red"
)
plot(
  table(crp(10000, 10))
  , ylab="Number of occupants", sub="Alpha=10", cex.lab=1.5, col="green"
)
plot(
  table(crp(10000, 20))
  ,xlab="Table number", sub="Alpha=20", ylab='', cex.lab=1.5, col="blue"
)
dev.off()
