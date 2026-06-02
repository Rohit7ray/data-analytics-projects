# Data Handling
import numpy as np
import pandas as pd

# Text Processing
import re
import string
import contractions
from spellchecker import SpellChecker

# NLTK
import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords, wordnet
from nltk.stem import PorterStemmer, WordNetLemmatizer


nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')
nltk.download('averaged_perceptron_tagger')

# Feature Engineering
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfVectorizer

# Train Test Split
from sklearn.model_selection import train_test_split

# Models
from sklearn.naive_bayes import MultinomialNB
from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import SVC
from sklearn.ensemble import BaggingClassifier
from sklearn.ensemble import HistGradientBoostingClassifier
from lightgbm import LGBMClassifier

# Evaluation
from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    confusion_matrix,
    classification_report,
    roc_curve,
    roc_auc_score
)

# Cross Validation
from sklearn.model_selection import KFold, cross_val_score

# Visualization
import matplotlib.pyplot as plt
import seaborn as sns

# Warnings
import warnings
warnings.filterwarnings("ignore")




## ---------- Loading File ----------
amazon = pd.read_csv('amazon_cells_labelled.txt',delimiter = '\t', header = None, names = ['Text','Label'])
print(amazon.head())

## Checking the data type
amazon.dtypes

## Reviewing the text
text = amazon['Text']
text[:5]

## ----------- PRE PROCESSING -----------

#creating an emplty list to store preprocessed text
text1 = []

def get_wordnet_pos(word):
    #Map POS tag to first character lemmatize() accepts
    tag = nltk.pos_tag([word])[0][1][0].upper()
    tag_dict = {
        "J": wordnet.ADJ,
        "N": wordnet.NOUN,
        "V": wordnet.VERB,
        "R": wordnet.ADV
    }
    return tag_dict.get( tag, wordnet.NOUN) #.get(key, default_value)


    #Counter to Display only the first 3 records
    display_count = 0

    #Process all records
    for review in text:
        if display_count<3: #Display intermediate result
            print(f"Original: {review}")
        expanded_review = fix(review) #the fix() function automatically expands contractions into their full forms.
        if display_count < 3:
            print(f"After expanding contractions: {expanded_review}")


        # Remove punctuation
        no_punctuation = expanded_review.translate(str.maketrans('', '', string.punctuation))
        if display_count < 3:
            print(f"After removing punctuation: {no_punctuation}")

        # Remove digits/numbers
        no_digits = no_punctuation.translate(str.maketrans('', '', string.digits))
        if display_count < 3:
            print(f"After removing digits: {no_digits}")

        # Convert to lowercase
        processed_review = no_digits.lower()
        if display_count < 3:
            print(f"After converting to lowercase: {processed_review}")

        # Remove stopwords
        no_stopwords = ' '.join(word for word in processed_review.split() if word not in stop_words)
        if display_count < 3:
            print(f"After removing stopwords: {no_stopwords}")


        # # Handling lemmatizer
        lemmatized_words = ' '.join(lemmatizer.lemmatize(w, get_wordnet_pos(w)) for w in no_stopwords.split())
        if display_count < 3:
            print(f"After Handling lemmatizer: {lemmatized_words}")

        # # After stemming
        stemmer = PorterStemmer()
        stemmed_review = ' '.join(stemmer.stem(word) for word in lemmatized_words.split())
        if display_count < 3:
          print(f"After stemming: {stemmed_review}")

        # After spell correction
        spell = SpellChecker()
        corrected_review = ' '.join(spell.correction(word) if spell.correction(word) else word for word in lemmatized_words.split())
        if display_count < 3:
            print(f"After spell correction: {corrected_review}")
            print("-" * 50)  # Separator for readability

        # Add to the final list
        text1.append(corrected_review)

        # Increment display counter
        display_count += 1

# Print the final processed text for verification
print("Final Processed Text:")
print(text1[:3])  # Show only the first 3 processed examples if needed

