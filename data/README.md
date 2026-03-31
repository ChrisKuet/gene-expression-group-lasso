# Data Description

## Overview

This project uses the **`bardet` dataset**, which is available in R through the `gglasso` package.

The dataset is commonly used for illustrating high-dimensional regression with grouped predictors.

---

## Dataset Characteristics

- **Number of observations:** 120  
- **Number of predictors:** 100  
- **Response variable:** Continuous outcome  
- **Predictor structure:** Grouped  

---

## Group Structure

The 100 predictors are organized into:

- **20 groups (genes)**
- **5 predictors per group**

Each group corresponds to a gene represented through **basis expansion (e.g., B-spline basis functions)**.

This grouped structure motivates the use of **group lasso**, which selects or removes entire groups of predictors.

---

## How the Data Is Loaded

The dataset is loaded directly in R using:

```r
data(bardet)
