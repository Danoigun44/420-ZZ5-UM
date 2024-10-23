# Define a map of the top 5 best foods
locals {
  best_foods = {
    "food1" = "Rice"
    "food2" = "Beans"
    "food3" = "Chicken"
    "food4" = "Beef"
    "food5" = "Stew"
  }
}

# Output each food item using a for_each loop
output "best_foods" {
  description = "The top 5 best foods"
  value       = { for key, value in local.best_foods : key => value }
}
