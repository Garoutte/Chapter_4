#Name:
#Description

library(vegan) # (v2.2-1)
library(edgeR) # (v3.8.6)


groups = read.csv(File_treatments.csv', row.names = 1)

input = read.csv("File.csv", row.names = 1)

str(input)
dim(input)

tinput = t(input)
log = tran(input, 'log', base = 2, b = 1)

##PERMANOVA
adonis(log2 ~ treatment, data=groups)

##NMDS
mds.data=metaMDS(log2, distance='bray', k = 2, trymax=1000, autotransform=FALSE, wascores=TRUE, nthreshold=6)
mds.data
mds.data$points ## samples scores
mds.data$species ## species scores
stressplot(mds.data)
goodness(mds.data)
plot(mds.data, display = "sites", xlab = "NMDS Axis 1", ylab = "NMDS Axis 2") 
text(mds.data, display = 'sites', pos = 1)
