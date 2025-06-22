library(utils)
install.packages("gapminder")

library(gapminder)

summary(gapminder)

mean(gapminder$gdpPercap)

mean_gdp_per_cap <-mean(gapminder$gdpPercap)

attach(gapminder)
median(pop)
hist(lifeExp)
hist(log(pop))
boxplot(lifeExp ~ continent)
plot(lifeExp ~log(gdpPercap))


gapminder %>%
  select(country, lifeExp) %>%
  filter(country %in% c("South Africa", "Ireland")) %>%
  group_by(country) %>%
  summarise(Average_life = mean(lifeExp))

library(dplyr)

df1 <- gapminder %>%
  select(country,lifeExp) %>%
  filter(country =='South Africa'|
           country == 'Ireland')

t.test(data =df1,lifeExp ~ country)

install.packages('ggplot2')
library(ggplot2)


gapminder %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap),y=lifeExp,col=year,size=pop))+
  geom_point(alpha=0.3)+
  geom_smooth(method = lm)+
  facet_wrap(~continent)


lm(lifeExp ~ gdpPercap)
