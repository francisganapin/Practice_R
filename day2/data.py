import csv

data = [
    ["Month", "Income", "Rent", "Utilities", "Groceries", "Transportation", "Entertainment", "Savings", "Investments", "Debt Payments"],
    ["2024-01", 4500, 1200, 300, 400, 250, 150, 1000, 500, 200],
    ["2024-02", 4600, 1200, 310, 420, 260, 140, 1100, 550, 180],
    ["2024-03", 4550, 1200, 290, 410, 240, 160, 1050, 530, 190],
    ["2024-04", 4700, 1200, 320, 430, 270, 130, 1150, 600, 210],
    ["2024-05", 4800, 1250, 300, 450, 280, 120, 1200, 620, 220],
    ["2024-06", 4750, 1250, 310, 440, 260, 140, 1180, 610, 200],
]


csv_filename = 'budget_data.csv'

with open(csv_filename,mode='w',newline='') as file:
    writer = csv.writer(file)
    writer.writerows(data)

print(f" CSV file '{csv_filename}' created successfully! ")