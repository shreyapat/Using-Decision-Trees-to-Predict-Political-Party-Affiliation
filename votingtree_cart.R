# votingtree_cart

#This is a model of a decision tree that uses votingdata.csv and rpart CART modeling to predict the political party affiliation of voters

#Read in csv with voting data
data = read.csv(file="votingdata.csv",head = TRUE,sep=",")
#View top few rows & double check data
head(data)
#data frame
str(data)

#Set seed to start at the same spot - make it replicatable
set.seed(9850)
#Set condition
g <- runif(nrow(data))
#Reorder
datar <- data[order(g),]
#Double check data
names(data)

#Set training data & view
m2 <- rpart::rpart(class ~., data=datar[1:300,], method= "class")
m2
#Plot
rpart.plot::rpart.plot(m2)

#Develop a predictive model
p2 <- predict(m2, datar[301:435,], type="class")

#Create the confusion table
tabledata <- table(datar[301:435, 5], predicted=p2)
tabledata