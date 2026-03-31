# ============================================================
# utils_metrics.R
# Helper functions for model evaluation
# ============================================================

# Correlation between observed and predicted values
correlation_metric <- function(y, pred) {
  cor(y, pred)
}

# R-squared
r_squared_metric <- function(y, pred) {
  1 - sum((y - pred)^2) / sum((y - mean(y))^2)
}

# Root Mean Squared Error
rmse_metric <- function(y, pred) {
  sqrt(mean((y - pred)^2))
}

# Combined metrics table for one model
model_metrics <- function(y, pred, model_name) {
  data.frame(
    Model = model_name,
    Correlation = correlation_metric(y, pred),
    R2 = r_squared_metric(y, pred),
    RMSE = rmse_metric(y, pred)
  )
}
