set.seed(1000)
crp = function(n, alpha) {
  culster <- c(1)
  pro.cluster <- 2
  for (i in 1:(n-1)) {
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

png("plots/crp.png", width = 1000, height=600)
barplot(names.arg=Alpha, tables, col="mediumvioletred", main='CRP for different alpha values,
        N=1000', xlab= "Alpha", ylab = "Number of distinct tables", cex.main=2.5,
        cex.axis = 1.25, cex.names=1.5, cex.lab=1.5)
dev.off()
