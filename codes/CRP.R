set.seed(1000)
crp = function(n, alpha) {
  cluster <- c(1)
  newCluster <- 2
  for (i in 1:(n-1)) {
    if (runif(1,0,1) < alpha / (alpha + i)) {
      cluster <- c(cluster, newCluster)
      newCluster <- newCluster+1
    } else {
      sampled <- sample(cluster, 1)
      cluster <- c(cluster, sampled)
    }
  }
  cluster
}

clusters =c()
Alpha = c(1,5,10,20,30,50,70,100)
for (alpha in Alpha){
  clusters = c(clusters,max(crp(1000,alpha)))
}

png("plots/crp.png", width = 1000, height=600)
barplot(names.arg=Alpha, clusters, col="mediumvioletred", main='CRP for different alpha values,
        N=1000', xlab= "Alpha", ylab = "Number of distinct tables", cex.main=2.5,
        cex.axis = 1.25, cex.names=1.5, cex.lab=1.5)
dev.off()
