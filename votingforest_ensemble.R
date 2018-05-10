# votingforest_ensemble
# ensembleR package

#This is a model of a random forest that uses votingdata.csv and ensemble to predict the political party affiliation of voters

#Read in csv with voting data
data = read.csv(file="votingdata.csv",head=TRUE,sep=",")
#View top few rows & double check data
head(data)
#data frame
str(data)

#Set seed to start at the same spot - make it replicatable
set.seed(9850)
#Set condition
gp<- runif(nrow(data))
#Reorder
datar <- data[order(gp),]

#Training set
train <- sample(150,100)
data_train <- datar[train,] #100 observations
data_test <- datar[-train,] #50 observations
rfm <- randomForest::randomForest(class ~., data_train)

#Run prediction
rp <- predict(rfm, data_test)

#View 
tabledata <- table(data_test[,5], predicted=rp)
tabledata
