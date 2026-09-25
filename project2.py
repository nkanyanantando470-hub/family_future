import datetime

today = datetime.date.today()
expenses = {"data": 50, "transport": 30, "food": 60}  # Reduced to R140
total = sum(expenses.values())
income = 150
left = income - total

print(f"Date: {today}")
print(f"Spent: R{total}")
print(f"Left: R{left}")

if left < 0:
    print("Status: RED - overspent!")
else:
    print("Status: GREEN - saving!")

with open("daily_log.txt", "a") as f:
    f.write(f"{today} | Spent R{total} | Left R{left} | GREEN\n")

print("Logged to daily_log.txt")
