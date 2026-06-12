# Amazon Review Sentiment Analysis

## Overview

This project performs sentiment analysis on Amazon product reviews using Natural Language Processing (NLP) and Machine Learning techniques.

The objective is to classify reviews as Positive or Negative based on their textual content.

## Dataset

Dataset: Amazon Cells Labelled Dataset

* Total Reviews: 1000
* Classes:

  * Positive (1)
  * Negative (0)

## Text Preprocessing

The following preprocessing steps were applied:

1. Contraction Expansion
2. Punctuation Removal
3. Digit Removal
4. Lowercase Conversion
5. Stopword Removal
6. POS-based Lemmatization

## Feature Engineering

Bag of Words (BoW) using CountVectorizer

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

## Results

Results are available in:

* model_results.csv

## Technologies Used

* Python
* Pandas
* NLTK
* Scikit-Learn

## How to Run

```bash
pip install -r requirements.txt
python BOW_MAIN.py
```

## Project Structure

```text
Sentiment-Analysis/
BOW
├──
   ├── data(amazon_cll_labelled.txt)
   ├── BOW_MAIN.py
   ├── requirements.txt
   ├── model_rsults.csv
   └── README.md
```
