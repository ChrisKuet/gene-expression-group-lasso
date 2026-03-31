# ============================================================
# run_analysis.R
# Run the full analysis pipeline
# ============================================================

source("src/01_setup.R")
source("src/02_load_and_split_data.R")
source("src/03_fit_lasso.R")
source("src/04_fit_group_lasso.R")
source("src/05_evaluate_models.R")
source("src/06_save_outputs.R")

message("Full analysis pipeline completed successfully.")
