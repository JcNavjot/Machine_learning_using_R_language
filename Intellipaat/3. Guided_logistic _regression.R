customer_churn<-read.csv("customer_churn.csv")


# encoding the independent variable as it is in the form of yes no and we want it to be n 0,1

customer_churn$Churn = factor(customer_churn$Churn,
                         levels = c('No', 'Yes'),
                         labels = c(0,1))

# splitting the dataset...

split_tag = sample.split(customer_churn$Churn, SpliRatio = 0.65)

train = subset(customer_churn, split_tag == T)
test = subset(customer_churn, split_tag == F)

  
#building the model  
  
glm(Churn~MonthlyCharges, data= customer_churn, family="binomial") ->log_mod1

#prediction for one record, you need to put value into dataframe for one record...

predict(log_mod1,data.frame(MonthlyCharges=77),type="response")


#prediction for other record ...

predict(log_mod1,data.frame(MonthlyCharges=20:100),type="response")



















