library(readr)

data <- read_csv('budget_data.csv')

#total income across the map 
total_month <- sum(data$Income)

#which month was highest saving
top_savings_month <- data$Month[which.max(data$Income)]

total_expenses <- sum(data$Rent + data$Utilities 
            + data$Groceries + data$Transportation +data$Entertainment + data$`Debt Payments`)

#months that invest most
top_invest_month <- data$Month[which.max(data$Investments)]

#average monthly debt
average_debt_montly <- mean(data$`Debt Payments`)

#saving rate each month
saving_rate <- mean((data$Savings/data$Income) * 100)

#total spen on grocery accross all months
groceries_all_months <- sum(data$Groceries)

#net cash flow
net_cash_flow <- sum(total_month - total_expenses)