source("dp-means.R")

data1 = read.table("mcdonalds-normalized-data.txt", header = T, sep = "\t", comment.char = "", quote = "")
mcd <- data1[ ,1:14]
colnames(mcd) <- c('x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7', 'x8', 'x9', 'x10', 'x11', 'x12', 'x13', 'x14')


data <- mcd
dp.results <- dp.means(data, 1.6, tolerance=10e-4)
data1$clusters = dp.results$assignments

#ggplot(data, aes(x = x1, y = x2, color = dp.results$assignments)) + geom_point()



cluster_burgers = data1[data1$clusters==2, ]
cluster_lowfat = data1[data1$clusters==3, ]
cluster_breakfast = data1[data1$clusters==5, ]


colors1 <- c("red", "orange", "yellow")
colors2 <- c("blue", "cyan", "purple")
colors3 <- c("green", "darkolivegreen1", "darkgreen")
png("dpmeans.png", width =1200, height =600)
par(mfrow=c(1,3))

barplot(as.matrix(cluster_burgers[1:3,1:14]), beside=T, 
        xlab= "Burgers etc.", horiz=T,las =2,yaxt="n", col=colors1, cex.axis=1.5,
        cex.lab = 2)
barplot(as.matrix(cluster_lowfat[c(55,60,63),1:14]), beside=T,horiz=T, 
        xlab = "Lowfat drinks",las=2,col=colors2, cex.names=1.5,cex.axis=1.5,
        cex.lab = 2)
mtext("Nutritional profiles for select items from three different clusters using DP-means",
      outer = F, cex=2)
barplot(as.matrix(cluster_breakfast[3:5,1:14]), beside=T,horiz=T, 
        xlab = "Breakfast food", las=2,col=colors3, cex.names=1.5,cex.axis=1.5,
        cex.lab = 2)

dev.off()

