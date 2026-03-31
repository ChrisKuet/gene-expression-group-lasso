# ============================================================
# 01_setup.R
# Project setup: load packages, set seed, create folders
# ============================================================

# Load required packages
library(glmnet)
library(gglasso)

# Reproducibility
set.seed(2)

# Create output directories if they do not already exist
dir.create("results", showWarnings = FALSE)
dir.create("results/figures", showWarnings = FALSE, recursive = TRUE)
dir.create("results/tables", showWarnings = FALSE, recursive = TRUE)
dir.create("results/models", showWarnings = FALSE, recursive = TRUE)

message("Setup complete.")
