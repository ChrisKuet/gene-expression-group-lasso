# ============================================================
# 02_load_and_split_data.R
# Load bardet data, define grouping structure, split train/test
# ============================================================

# Load the built-in bardet dataset
data(bardet)

# Extract predictors and response
X <- bardet$x
y <- as.numeric(bardet$y)

# Basic dimensions
N <- nrow(X)     # total observations
P <- ncol(X)     # total predictors

# Train/test split sizes
n_train <- 80

# Random training indices
train_id <- sample(seq_len(N), size = n_train, replace = FALSE)
test_id  <- setdiff(seq_len(N), train_id)

# Split data
X_train <- X[train_id, ]
y_train <- y[train_id]

X_test <- X[test_id, ]
y_test <- y[test_id]

# Grouping structure:
# 100 predictors = 20 groups, each group has 5 predictors
group <- rep(1:20, each = 5)

# Save a lightweight data summary for reference
data_summary <- data.frame(
  Quantity = c("Observations", "Predictors", "Training observations",
               "Testing observations", "Number of groups", "Group size"),
  Value = c(N, P, length(train_id), length(test_id), 20, 5)
)

write.csv(data_summary, "results/tables/data_summary.csv", row.names = FALSE)

message("Data loaded and split successfully.")
message(sprintf("Training set: %d observations", length(y_train)))
message(sprintf("Testing set: %d observations", length(y_test)))
message(sprintf("Predictors: %d", P))
message(sprintf("Groups: %d", length(unique(group))))
