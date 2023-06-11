customer_churn<-read.csv("customer_churn.csv")

library(dplyr)

customer_features = customer_churn %>% select("tenure","MonthlyCharges","TotalCharges")

head(customer_features)


# Here, we are divinding monthlycharges into 3 clusters 
k_month = kmeans(customer_features$MonthlyCharges,3)

k_month


# Binding  monthlycharges to cluster so that we can see which record belongs to which cluster ...
month_group = cbind(Month=customer_features$MonthlyCharges, Clusters=k_month$cluster)

head(month_group)

# converting into dataframe ...

as.data.frame(month_group)->month_group

View(month_group)


# Assigning each record to its respective cluster ...

month_group %>% filter(Clusters==1)-> month_group_1
month_group %>% filter(Clusters==2)-> month_group_2

month_group %>% filter(Clusters==3)-> month_group_3
















