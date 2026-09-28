# Project 3 - Cloud Cost Calculator
print("=== Project 3: Cloud Future ===")

savings = 10  # From Project 2
aws_free = 0  # AWS free tier is R0 for 12 months
google_free = 0  # Google Cloud free tier

cloud_costs = {
    "AWS Free Tier": 0,
    "Google Cloud Free": 0,
    "Domain name": 20,
    "After free tier (monthly)": 100
}

print(f"Your monthly saving: R{savings}")
print(f"\nCan you start cloud with R{savings}?")
for service, cost in cloud_costs.items():
    status = "YES" if savings >= cost or cost == 0 else "Need more savings"
    print(f"  {service}: R{cost} -> {status}")

print("\n--- Family Cloud Plan ---")
if savings >= 0:
    print("✓ You can start TODAY - free tier = R0")
    print("✓ Learn: AWS, Linux, Python")
    print("✓ Goal: Cloud Support job = R8000+ / month")
    print("\nVillage to Cloud: POSSIBLE!")
else:
    print("Keep saving!")

# Save future goal
with open("goal.txt", "w") as f:
    f.write("Goal: Cloud Engineer | Savings: R10 | Start: AWS Free Tier\n")
print("\nGoal saved to goal.txt")
