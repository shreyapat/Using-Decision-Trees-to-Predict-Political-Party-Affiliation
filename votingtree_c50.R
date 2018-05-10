# votingtree_c50

#This is a model of a decision tree that uses votingdata.csv and C5.0 to predict the political party affiliation of voters.

#Read in csv with voting data
data = read.csv(file="votingdata.csv", head = TRUE, sep = ",")
#View top few rows & double check data
head(data)
#data frame
str(data)

#Set seed to start at the same spot - make it replicatable
set.seed(9850)
#Set condition
gp<- runif(435)
#Reorder
datar <- data[order(gp),]
#Double check data
head(datar)

#Set as factor
datar$class<-as.factor(datar$class)
#Set up c5.0 algorithm
m1 <- C5.0(datar[1:300, -5], datar$class[1:300])

#Plot & summary
plot(m1)
summary(m1)

#Set up prediction
p1 <- predict(m1,datar[301:435,])

#Check confusion matrix
tabledata<- table(datar[301:435,5], predicted=p1)
tabledata