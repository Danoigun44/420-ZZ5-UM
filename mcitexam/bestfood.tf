# Define a list of the top 5 best foods
locals {
  best_foods = ["Rice", "Beans", "Chicken", "Beef", "Stew"]
}

# Output the list of top 5 best foods
output "best_foods" {
  description = "The top 5 best foods"
  value       = local.best_foods
}
