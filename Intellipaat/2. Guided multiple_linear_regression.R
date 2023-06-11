data = read.csv('customer_churn.csv')

library(caTools)

split_model = sample.split(data$tenure, SplitRatio = 0.65)


train = subset(data, split_model == T)
test = subset(data, split_model == F)

# building the model ...

mod1 = lm(tenure~MonthlyCharges+gender+InternetService+Contract, data = train)

# predict

result1 = predict(mod1,test)


final_data1 = cbind(Actual = test$tenure, Predicted = result1)

View(final_data1)

final_data1 = as.data.frame(final_data1)

# error

error1 = final_data1$Actual - final_data1$Predicted
View(error1)


final_data1 = cbind(final_data1, error1)


# RMSE

rmse1 = sqrt(mean((final_data1$error1)^2))


# 2ND MODEL


mod2 = lm(tenure~Partner+PhoneService+TotalCharges+PaymentMethod, data = train)

# predict

result2 = predict(mod2,test)


final_data2 = cbind(Actual = test$tenure, Predicted = result2)

View(final_data2)

final_data2 = as.data.frame(final_data2)

# error

error2 = final_data2$Actual - final_data2$Predicted
View(error2)


final_data2 = cbind(final_data2, error2)


# RMSE

rmse2 = sqrt(mean((final_data2$error2)^2, na.rm = T))

# Here, we got rmse2 as na before beause there were some na values in the totalcharges column

# so, the second model is much bettert than the first model





