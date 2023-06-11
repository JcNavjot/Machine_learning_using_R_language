data = read.csv('city_temperature.csv')

library(caTools)

split_model = sample.split(data$tenure, SplitRatio = 0.70)


# spliting into train and test ...


train = subset(data, split_model == T)
test = subset(data, split_model == F)