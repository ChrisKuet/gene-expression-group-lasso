# ============================================================
# 04_fit_group_lasso.R
# Fit group lasso using 5-fold CV on training data
# ============================================================

# Fit group lasso model
group_lasso_cv <- cv.gglasso(
  x = X_train,
  y = y_train,
  group = group,
  loss = "ls",
  nfolds = 5
)

# Save CV plot
png("results/figures/cv_group_lasso.png", width = 900, height = 700)
plot(group_lasso_cv, main = "Cross-Validation Curve: Group Lasso")
dev.off()

# Best lambda
group_lasso_lambda_min <- group_lasso_cv$lambda.min

# Test-set predictions
group_lasso_pred <- as.numeric(
  predict(group_lasso_cv, newx = X_test, s = "lambda.min")
)

# Coefficients at optimal lambda
group_lasso_coef <- coef(group_lasso_cv, s = "lambda.min")

# Convert coefficients to vector and remove intercept
group_lasso_coef_vec <- as.numeric(group_lasso_coef)[-1]

# Number of selected predictors
group_lasso_nonzero <- sum(group_lasso_coef_vec != 0)
group_lasso_zero <- length(group_lasso_coef_vec) - group_lasso_nonzero

# Number of selected groups
selected_groups <- unique(group[group_lasso_coef_vec != 0])
n_selected_groups <- length(selected_groups)

# Save coefficient table
group_lasso_coef_df <- data.frame(
  Term = rownames(as.matrix(group_lasso_coef)),
  Coefficient = as.numeric(group_lasso_coef)
)

write.csv(
  group_lasso_coef_df,
  "results/tables/group_lasso_coefficients.csv",
  row.names = FALSE
)

# Save model summary
group_lasso_summary <- data.frame(
  Model = "Group Lasso",
  Lambda_min = group_lasso_lambda_min,
  Nonzero_predictors = group_lasso_nonzero,
  Zero_predictors = group_lasso_zero,
  Selected_groups = n_selected_groups
)

write.csv(
  group_lasso_summary,
  "results/tables/group_lasso_summary.csv",
  row.names = FALSE
)

message("Group lasso model fitted successfully.")
message(sprintf("Optimal lambda: %.6f", group_lasso_lambda_min))
message(sprintf("Selected predictors: %d", group_lasso_nonzero))
message(sprintf("Selected groups: %d", n_selected_groups))
