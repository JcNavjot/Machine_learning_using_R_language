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

glm(Churn~gender+Partner+InternetService+MonthlyCharges, data= train, family="binomial") ->log_mod1


# predicting the results ... 

result_log1 = predict(log_mod1, newdata = test, type = 'response')

# visualizing the results

View(result_log1)

range(result_log1)

# building confusion matrix

table(test$Churn, result_log1 > 0.4)


# 2nd model

glm(Churn~PaymentMethod+TechSupport+tenure+PaperlessBilling, data= train, family="binomial") ->log_mod2


# predicting the results ... 

result_log2 = predict(log_mod2, newdata = test, type = 'response')

range(result_log2)

# building confusion matrix

table(test$Churn, result_log2 > 0.4)

# accuracy
 acc2 = (1530+370)/(1530+370+284+281)


