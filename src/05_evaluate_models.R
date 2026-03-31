# ============================================================
# 05_evaluate_models.R
# Evaluate lasso and group lasso on the test set
# ============================================================

# Load metric helpers
source("src/utils_metrics.R")

# Compute performance metrics
lasso_results <- model_metrics(y_test, lasso_pred, "Lasso")
group_lasso_results <- model_metrics(y_test, group_lasso_pred, "Group Lasso")

# Combine results
performance_table <- rbind(lasso_results, group_lasso_results)

# Round for cleaner display
performance_table$Correlation <- round(performance_table$Correlation, 3)
performance_table$R2 <- round(performance_table$R2, 3)
performance_table$RMSE <- round(performance_table$RMSE, 3)

# Print to console
print(performance_table)

message("Model evaluation complete.")
