# R150 Village Budget Tracker
income = 150
expenses = {"data": 50, "charging": 30, "food": 70}
total = sum(expenses.values())
left = income - total
print(f"Income: R{income}")
print(f"Expenses: R{total}")
print(f"Left: R{left} - Enough to learn Cloud")
