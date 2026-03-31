# ============================================================
# 03_fit_lasso.R
# Fit lasso using 5-fold CV on training data
# ============================================================

# Fit lasso model
lasso_cv <- cv.glmnet(
  x = X_train,
  y = y_train,
  alpha = 1,
  nfolds = 5
)

# Save CV plot
png("results/figures/cv_lasso.png", width = 900, height = 700)
plot(lasso_cv, main = "Cross-Validation Curve: Lasso")
dev.off()

# Best lambda
lasso_lambda_min <- lasso_cv$lambda.min

# Test-set predictions
lasso_pred <- as.numeric(
  predict(lasso_cv, newx = X_test, s = "lambda.min")
)

# Coefficients at optimal lambda
lasso_coef <- coef(lasso_cv, s = "lambda.min")

# Count selected predictors (excluding intercept)
lasso_nonzero <- sum(as.matrix(lasso_coef)[-1, 1] != 0)
lasso_zero <- length(as.matrix(lasso_coef)[-1, 1]) - lasso_nonzero

# Save coefficient table
lasso_coef_df <- data.frame(
  Term = rownames(as.matrix(lasso_coef)),
  Coefficient = as.numeric(lasso_coef)
)

write.csv(
  lasso_coef_df,
  "results/tables/lasso_coefficients.csv",
  row.names = FALSE
)

# Save model summary
lasso_summary <- data.frame(
  Model = "Lasso",
  Lambda_min = lasso_lambda_min,
  Nonzero_predictors = lasso_nonzero,
  Zero_predictors = lasso_zero
)

write.csv(
  lasso_summary,
  "results/tables/lasso_summary.csv",
  row.names = FALSE
)

message("Lasso model fitted successfully.")
message(sprintf("Optimal lambda: %.6f", lasso_lambda_min))
message(sprintf("Selected predictors: %d", lasso_nonzero))
