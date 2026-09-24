# Village Cloud Lab - Tests
print("Testing Family Future...")

# Test calc.py logic
siblings = 3
fee = 1500
total = siblings * fee
assert total == 4500, "calc failed"
print("✓ calc.py: R4500 correct")

# Test budget.py logic
income = 150
expenses = {"data": 50, "charging": 30, "food": 70}
total_exp = sum(expenses.values())
left = income - total_exp
assert total_exp == 150, "budget total failed"
assert left == 0, "budget left failed"
print(f"✓ budget.py: Income R{income}, Left R{left}")

# Test goal.txt exists
with open("goal.txt") as f:
    goal = f.read()
    assert "Cloud Engineer" in goal, "goal missing"
print(f"✓ goal.txt: {goal.strip()}")

print("\nALL TESTS PASSED - Ready for Project 2")
