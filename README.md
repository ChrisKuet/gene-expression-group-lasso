# Gene Expression Regression with Group Lasso

Structured sparse regression for high-dimensional gene expression data using lasso and group lasso in R.

---

## Overview

This project investigates the use of structured sparsity methods for predicting gene expression levels in a high-dimensional setting. The dataset consists of 120 samples and 100 predictors, where features are naturally grouped into 20 genes with 5 basis-expanded variables per gene.

We compare standard lasso and group lasso models to evaluate how incorporating known feature group structure impacts predictive performance. Results show that group lasso achieves superior performance by selecting relevant groups of predictors rather than individual variables.

---

## Key Features

- High-dimensional regression with grouped predictors  
- Comparison of **lasso vs. group lasso**  
- Cross-validation for tuning parameter selection  
- Model evaluation using **correlation, R², and RMSE**  
- Fully reproducible analysis in R  

---

## Results Summary

| Model       | Correlation | R²    | RMSE  |
|-------------|-------------|-------|-------|
| Lasso       | 0.75        | 0.454 | 0.013 |
| Group Lasso | 0.86        | 0.716 | 0.007 |

Group lasso outperforms lasso, highlighting the importance of incorporating known grouping structure in high-dimensional data.

---

## Methods

- **Lasso** (L1 regularization via `glmnet`)
- **Group Lasso** (grouped L2 penalty via `gglasso`)
- 5-fold cross-validation for optimal tuning parameter selection
- Train/test split (80/40) for out-of-sample evaluation

---

## Repository Structure

```text
src/        # Model training and evaluation scripts  
notebooks/  # R Markdown analysis  
results/    # Tables and figures  
report/     # Original project report  
