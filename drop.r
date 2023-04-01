# Install and load the 'instance' package
if (!requireNamespace("instance", quietly = TRUE)) {
  install.packages("instance")
}

library(instance)

# Load the 'iris' dataset
data(iris)

# Separate features and labels
X <- iris[, 1:4]
y <- iris[, 5]

# Perform instance selection using the DROP3 method
selected_instances <- drop(X, y, method = "DROP3")

# Print the number of instances before and after selection
cat("Number of instances before DROP3:", nrow(X), "\n")
cat("Number of instances after DROP3:", nrow(selected_instances), "\n")

# Visualize the selected instances
library(ggplot2)

selected_data <- cbind(selected_instances, Species = factor(y[selected_instances$index]))
ggplot(selected_data, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Selected Instances After DROP3") +
  theme_minimal()
