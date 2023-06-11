data = read.csv('customer_churn.csv')


#Installing libraries to implement linear regression
#install.packages(caTools)
#library(caTools)

# Splitting the data

# we divided data into 65 and 35 % ratio.
split_tag = sample.split(data$MonthlyCharges, SplitRatio = 0.65)

# Now, creating test and train sets ...


train = subset(data, split_tag == T)
test = subset(data, split_tag == F)


## using lm function

model1 = lm(MonthlyCharges~tenure, data = train)

# Now,predicting the model values on top on test set

predicted_values = predict(model1, newdata =  test)

# Now, we use cbind function to compare actual and predicted values ...


final_data = cbind(Actual = test$MonthlyCharges, Predicted = predicted_values)

class(final_data)

#Here, we can see that final data is a matrix and if we need to subtract actual from predicted,
# then we need to convert it itno a dataframe

final_data = as.data.frame(final_data)

# finally error

error = final_data$Actual - final_data$Predicted
View(error)


## combining final dataset with error values

final_data = cbind(final_data, error)

View(final_data)

# Now, checking efficiency of our model using RMSE ...

rmse1 = sqrt(mean((final_data$error)^2))

# Now,let's s check another column ...


model2 = lm(MonthlyCharges~InternetService, data = train)

predicted_values2 = predict(model2, newdata =  test)


final_data2 = cbind(Actual = test$MonthlyCharges, Predicted = predicted_values2)


final_data2 = as.data.frame(final_data2)

# finally error

error2 = final_data2$Actual - final_data2$Predicted
View(error2)



## combining final dataset with error values

final_data2 = cbind(final_data2, error2)

View(final_data2)

# Now, checking efficiency of our model using RMSE ...

rmse2 = sqrt(mean((final_data2$error2)^2))

# Now, as the rmse2 is lower this means that model 2(InternetService) is better in terms of 
# defining monthlycharges








