data = read.csv('customer_churn.csv')


library(caTools)


# we divided data into 65 and 35 % ratio.
split_tag = sample.split(data$Churn, SplitRatio = 0.65)

# Now, creating test and train sets ...

train = subset(data, split_tag == T)
test = subset(data, split_tag == F)

# installing package

##install.packages('tree')

# Now selecting tree package ...

##library(tree)

library(rpart)   # this is similar to import module in python


# data preprocessing .

data$Churn = factor(data$Churn,
                              levels = c('No', 'Yes'),
                              labels = c(0,1))

# first model 

mod_tree1 = rpart(formula = Churn ~ tenure,
                  data = train,
                  control = rpart.control(minsplit = 1))


#mod_tree1 = tree(Churn~tenure, data = train)

plot(mod_tree1)
text(mod_tree1)

# predicting values ...

result_1 = predict(mod_tree1, newdata = test, type = 'class')

View(result_1)


# building confusion matrix ...

table(test$Churn, result_1)

# Computing accuracy ...

(1735+131)/(1735+131+523+76)


# second model ...

mod_tree2 = tree(Churn ~ tenure + MonthlyCharges, data =  train)

plot(mod_tree2)
text(mod_tree2)


# third model ...

mod_tree3 = tree(Churn ~ MonthlyCharges + tenure + contract + TechSupport, data =  train)

plot(mod_tree3)
text(mod_tree3)



View(data$tenure)




























