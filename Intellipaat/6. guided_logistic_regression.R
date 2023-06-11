customer_churn<-read.csv("customer_churn.csv")

customer_churn$Churn = factor(customer_churn$Churn,
                              levels = c('No', 'Yes'),
                              labels = c(0,1))
library(caTools)


# splitting the dataset...

split_tag = sample.split(customer_churn$Churn, SplitRatio = 0.65)

train = subset(customer_churn, split_tag == T)
test = subset(customer_churn, split_tag == F)

#building the model ...

glm(Churn~MonthlyCharges, data= train, family="binomial") ->log_mod1
