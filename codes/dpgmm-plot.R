library(plyr)
clusters_dpgmm= read.table("data/clusters-dpgmm.txt", sep=",", comment.char="", quote="")
normalized_mcdonalds = read.table("data/mcdonalds-normalized-data.txt", header = T, sep = "\t", comment.char = "", quote = "")
data = cbind(normalized_mcdonalds,clusters_dpgmm)
data = rename(data, c("V1"= "clusters"))
a=count(data$clusters)
b = seq(nrow(a))
b1 =cbind(b,a)
b1 = b1[,1:2]
data$clusters=b1$b[match(data$clusters, b1$x)]


cluster_burgers = data[data$clusters==5, ]
cluster_lowfat = data[data$clusters==1, ]
cluster_breakfast = data[data$clusters==9, ]


colors1 <- c("red", "orange", "yellow")
colors2 <- c("blue", "cyan", "purple")
colors3 <- c("green", "darkolivegreen1", "darkgreen")

#jpeg(file ="dpgmm.jpeg", width =1000, height =600)
png("plots/dpgmm.png", width =1200, height =600)
par(mfrow=c(1,3))

barplot(as.matrix(cluster_burgers[1:3,1:14]), beside=T, 
        xlab= "Burgers etc.", horiz=T,las =2,yaxt="n", col=colors1, cex.axis=1.5,
        cex.lab = 2)
barplot(as.matrix(cluster_lowfat[3:5,1:14]), beside=T,horiz=T, 
        xlab = "Lowfat drinks",las=2,col=colors2, cex.names=1.5, cex.axis=1.5,
        cex.lab = 2)
mtext("Nutritional profiles for select items from three different clusters using DPGMM",
      outer = F, cex=2)
barplot(as.matrix(cluster_breakfast[2:4,1:14]), beside=T,horiz=T, 
        xlab = "Breakfast food", las=2,col=colors3, cex.names=1.5, cex.axis=1.5,
        cex.lab = 2)
#dev.copy(png, "plot1.png")
dev.off()
