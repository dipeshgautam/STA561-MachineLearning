set.seed(1000)
crp = function(num.customers, alpha) {
  table <- c(1)
  next.table <- 2
  for (i in 1:(num.customers-1)) {
    if (runif(1,0,1) < alpha / (alpha + i)) {
      table <- c(table, next.table)
      next.table <- next.table+1
    } else {
      select.table <- table[sample(1:length(table), 1)]
      table <- c(table, select.table)
    }
  }
  table
}

tables =c()
Alpha = c(1,5,10,20,30,50,70,100)
for (alpha in Alpha){
  tables = c(tables,max(crp(1000,alpha)))
}

png("crp.png", width = 1000, height=600)
barplot(names.arg=Alpha, tables, col="darkred", main='CRP for different alpha values,
        N=1000', xlab= "Alpha", ylab = "Number of distinct tables", cex.main=2.5)
dev.off()
# 
# png("crp.png", width = 1000, height=600)
# par(mfrow=c(3,1))
# plot(
#   table(crp(10000, 1))
#  , sub="Alpha=1", ylab='', main='CRP for different alpha values', cex.main=2,
#  cex.lab=1.5, col="red"
# )
# plot(
#   table(crp(10000, 3))
#   , ylab="Number of occupants", sub="Alpha=10", cex.lab=1.5, col="green"
# )
# plot(
#   table(crp(10000, 5))
#   ,xlab="Table number", sub="Alpha=20", ylab='', cex.lab=1.5, col="blue"
# )
# dev.off()
