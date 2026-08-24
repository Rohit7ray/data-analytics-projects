# Amazon Review Sentiment Analysis using LSA

## Overview

This project performs **sentiment analysis on Amazon product reviews** using Natural Language Processing (NLP) and Machine Learning techniques.

The objective is to classify customer reviews as **Positive or Negative** based on their textual content.

The project implements a complete NLP pipeline including text preprocessing, **TF-IDF feature extraction, Latent Semantic Analysis (LSA)** using Truncated SVD, and comparison of multiple machine learning classifiers.

---

## Dataset

**Dataset:** Amazon Cells Labelled Dataset

* **Total Reviews:** 1,000
* **Classes:**

  * `1` → Positive
  * `0` → Negative

The dataset is divided into:

* **800 reviews** → Training
* **200 reviews** → Testing

---

## Text Preprocessing

The following preprocessing techniques are applied to the review text:

1. **Contraction Expansion**
2. **Punctuation Removal**
3. **Digit Removal**
4. **Lowercase Conversion**
5. **Stopword Removal**
6. **POS-based Lemmatization**

POS tagging is used to determine the appropriate WordNet category before lemmatization.

### Example Workflow

```text
Raw Review
    ↓
Expand Contractions
    ↓
Remove Punctuation
    ↓
Remove Digits
    ↓
Convert to Lowercase
    ↓
Remove Stopwords
    ↓
POS-based Lemmatization
    ↓
Processed Review
```

---

## Feature Engineering

### TF-IDF

The processed reviews are first converted into numerical representations using **TF-IDF (Term Frequency–Inverse Document Frequency)**.
TF-IDF is fitted on the training data and then applied to the test data.

### Latent Semantic Analysis (LSA)

After TF-IDF transformation, **Truncated SVD** is applied to create the LSA representation.
The project uses **100 components** to represent the reviews in a lower-dimensional semantic space.

### Feature Engineering Pipeline

```text
Text
 ↓
TF-IDF
 ↓
Truncated SVD
 ↓
LSA Representation
 ↓
Machine Learning Classifier
```

---

## Models Evaluated

* Multinomial Naive Bayes
* Decision Tree Classifier
* HistGradientBoosting Classifier
* Bagging Classifier with SVM

## Evaluation Metrics

* Accuracy
* Precision
* Recall
* F1 Score
* 5-Fold Cross Validation Accuracy

The models are compared based on their classification performance on the test dataset.

---

## Results

The model comparison results are saved in:

```text
model_comparision_results.csv
```

The file contains:

| Metric      |
| ----------- |
| Model       |
| CV Accuracy |
| Accuracy    |
| Precision   |
| Recall      |
| F1 Score    |

The results are automatically sorted by **Accuracy**.

## Technologies Used

* NLTK
* Pandas
* WordNet
* TF-IDF
* Latent Semantic Analysis
* Truncated SVD

### Machine Learning

* Scikit-Learn
* Decision Tree
* Gaussian Naive Bayes
* HistGradientBoosting
* SVM
* Bagging

### Visualization

* Matplotlib

---

## Project Structure

```text
Sentiment-Analysis/
│
└── LSA/
    │
    ├── amazon_cells_labelled.txt
    │
    ├── LSA_Main.py
    │
    ├── requirements.txt
    │
    ├── model_comparision_results.csv
    │
    ├── reports/
    │   ├── Decision_Tree_report.txt
    │   ├── Gaussian_Naive_Bayes_report.txt
    │   ├── HistGradientBoosting_report.txt
    │   ├── Bagging_SVM_report.txt
    │   └── roc_curves.png
    │
    └── README.md
```

---

## Project Workflow

```text
Amazon Reviews
      ↓
Text Preprocessing
      ↓
TF-IDF Vectorization
      ↓
Truncated SVD
      ↓
LSA Features (100 Dimensions)
      ↓
Model Training
      ↓
Model Prediction
      ↓
Performance Evaluation
      ↓
Model Comparison
```

---

## Key NLP Concepts Demonstrated

This project demonstrates practical implementation of:

* Text preprocessing
* Contraction handling
* Stopword removal
* POS tagging
* Lemmatization
* TF-IDF
* Dimensionality Reduction
* Latent Semantic Analysis
* Truncated SVD
* Sentiment Classification
* Ensemble Learning
* Cross-Validation
* Confusion Matrix Analysis
* ROC/AUC Analysis

---
