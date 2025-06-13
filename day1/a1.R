library(purrr)

map(mtcars,mean)

map_chr(iris, ~ class(.x))

library(dplyr)


#average
iris %>%
  filter(Species =='setosa') %>%
  summarise(avg =mean(Sepal.Length))


library(dpylry)

mtcars %>%
  group_by(cyl) %>%
    summarise(avg_mpg = mean(mpg),.groups ='drop')


library(ggplot2)

ggplot(mtcars,aes(x =wt,y = mpg, color = factor(cly))) +
  geom_point(method = 'lm', se = FALSE) +
  theme_minimal()

cv <- function(x) sd(x) / mean(x)

apply(mtcars, 2, cv)

lapply


library(data.table)

dt <- as.data.table(mtcars)

dt[,.(avg_mpg = mean(mpg)), by = cyl]




library(caret)
model <- train(mpg ~ ., data = mtcars, method = "lm")
summary(model)




library(tidymodels)

linear_model <- linear_reg() %>%
  set_engine('lm') %>%
  fit(mpg ~ wt + hp, data = mtcars)


