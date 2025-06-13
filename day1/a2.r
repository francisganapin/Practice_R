library(dplyr)


iris %>%
  summarise(across(starts_with('Sepal'),mean))

#this return the mean and standard deviation for each Sepal Column.The result will be named like
iris %>%
  summarise(across(starts_with('Sepal'),list(mean = mean,sd=sd)))

# keep row where any Sepal column is greater than 6
iris %>%
  filter(if_any(starts_with('Sepal'), ~ .x > 6))


#keep row where all all Peta, columns are greater than 1
iris %>%
  filter(if_all(starts_with('Petal'),~ .x > 1))


summarise_mean <- function(data,col){
  data %>%
    summarise(mean_val = mean({{col}}, na.rm = TRUE ))
}

summarise_mean(iris, Sepal.Length)

summarise_mean_old <- function(data,col){
  col <- enquo(col)
  data %>%
    summarise(mean_val = mean(!!col,na.rm = TRUE))
  
}

summarise_mean_old(iris,Petal.Width)


library(purrr)

# square each number
map(1:5, ~ .x^2)

#apply summary to each numeric column

iris %>%
  select(where(is.numeric)) %>%
  map_df(summary)


my_summary <- function(df,col){
  df %>%
    summarise(
      mean = mean({{col}}, na.rm = TRUE),
      median = median({{col}},na.rm = TRUE),
      sd = sd({{col}},na.rm = TRUE)
    )
}

my_summary(iris,Sepal.Length)

my_group_summary <- function(df,group_col,target_col){
  df %>%
    group_by({{group_col}}) %>%
    summarise(
      mean = mean({{target_col}}, na.rm = TRUE),
      median = median({{target_col}},na.rm = TRUE),
      sd = sd({{target_col}},na.rm = TRUE),
      .groups = 'drop'
    )
}

my_group_summary(iris,Species,Sepal.Length)

install.packages("tidyverse") 
library(tidyverse)


head(iris)

# filter row
iris %>% filter(Species == 'setosa')

#Select Row
iris %>% select(Sepal.Length,Species)


#add new column:
iris %>% mutate(Ratio = Sepal.Length / Sepal.Width)

#summary of mean of Sepal.Length

iris %>% summarise(mean_length = mean(Sepal.Length))


# get group by legnth
iris %>%
  group_by(Species) %>%
  summarise(mean_length = mean(Sepal.Length))

iris %>%
  filter(Species == 'virginica')

iris %>%
  select(Petal.Length,Species)

# GET AREA of virginica
iris %>%
  mutate(Area = Sepal.Length * Sepal.Width)


#group by Species and get The average Petal.Width

iris %>%
  arrange(Sepal.Length)

iris %>%
  rename(Sepal_Len = Sepal.Length)

# select distict item
iris %>%
  distinct(Species)

#
iris %>%
  slice(1:5)

# count number how many times they apear 
iris %>%
  count(Species)

iris %>%
  filter(Species == 'setosa') %>%
  mutate(Area = Sepal.Length * Sepal.Width) %>%
  arrange(desc(Area))
 

iris %>%
  filter(Species == 'versicolor')

iris

iris %>%
  filter(Species == 'versicolor')
  mutate(Area = Sepal.Length * Sepal.Width) %>%
  arrange(desc(Area))

iris



library(tidy)
library(dplyr)

wide_df <- tibble(
  name = c('Alice','Bob'),
  math = c(90,85),
  english = c(95,80)
)

wide_df %>%
    pivot_longer(cols = math:english,names_to = 'subject', values_to = 'score')



long_df <- tibble(
  name = c('Alice','Alice','Bob','Bob'),
  subject = c('math','english','math','english'),
  score =c(90,95,85,80)
)


long_df %>%
  pivot_wider(names_from = subject, values_from = score )


df <- tibble(year ='2025',month ='05', day ='27')

df %>%
  unite('full_date',year,month,day,sep='-')

df <- tibble(score = c(90,NA,85))

df %>%
  replace_na(list(score=0))


library(tidyverse)

grades <- tibble(
  student = c('Anna','Ben'),
  Math = c(90,85),
  Science =c(92,88)
)

grades_long <- grades %>%
  pivot_longer(cols =Math:Science,
               names_to = 'subject',
               values_to = 'score'
               )

grades_long


grades_long %>%
  ggplot(aes(x = student, y = score, fill = subject)) +
  geom_col(position = "dodge") +
  labs(title = "Scores by Subject", y = "Score", x = "Student") +
  theme_minimal()




scores <- tibble(
  week = 1:5,
  Anna = c(80,85,88,90,92),
  Ben =  c(70,75,78,80,85)
)

scores_long <- scores %>%
  pivot_longer(cols = Anna:Ben, names_to = 'student', values_to = 'score')

scores_long %>%
  ggplot(aes(x =week,y = score, color = student ))+
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  labs(title = "Weekly Scores Over Time", y = "Score", x = "Week") +
  theme_light()



ggplot(iris,aes(x = Sepal.Length, y = Petal.Length, color = Species )) +
  geom_point() +
  labs(title ='Sepal vs Petal Lenght', x = 'Sepal lenght', y = 'Petal lenght')+
  theme_classic()


ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point() +
  facet_wrap(~ Species) +
  theme_minimal()



ggplot(iris,aes(x = Species, y = Sepal.Length, fill = Species ))+
  geom_boxplot() +
  scale_fill_brewer(palette = 'Pastel1') +
  theme_minimal()

students <- tibble(
  student_id = c(1,2,3),
  name = c('Ana','Ben','Cara')
)

grades <- tibble(
  student_id = c(1,2,3),
  math_score = c(90,85,95)
)


students %>%
  left_join(grades,by ='student_id')
