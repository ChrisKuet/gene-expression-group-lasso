# ============================================================
# 06_save_outputs.R
# Save final outputs: performance table, predictions, models
# ============================================================

# Save performance comparison table
write.csv(
  performance_table,
  "results/tables/model_performance.csv",
  row.names = FALSE
)

# Save test-set predictions
predictions_df <- data.frame(
  y_test = y_test,
  lasso_pred = lasso_pred,
  group_lasso_pred = group_lasso_pred
)

write.csv(
  predictions_df,
  "results/tables/test_set_predictions.csv",
  row.names = FALSE
)

# Save fitted models
saveRDS(lasso_cv, "results/models/lasso_cv_model.rds")
saveRDS(group_lasso_cv, "results/models/group_lasso_cv_model.rds")

message("Outputs saved successfully.")
