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

class Text_Preprocessor:
    def __init__(self):
        self.stop_words = set(stopwords.words('english'))
        self.lemmatizer = WordNetLemmatizer()
        self.spell = SpellChecker()

    def get_wordnet_pos(self, word):
        #Map POS tag to first character lemmatize() accepts
        tag = nltk.pos_tag([word])[0][1][0].upper()
        tag_dict = {
        "J": wordnet.ADJ,
        "N": wordnet.NOUN,
        "V": wordnet.VERB,
        "R": wordnet.ADV
        }
        return tag_dict.get(tag, wordnet.NOUN) #.get(key, default_value)
        

    def preprocess(self, reviews):

        processed_reviews = []

        for review in reviews:

            review = contractions.fix(review)

            review = review.translate(
                str.maketrans('', '', string.punctuation) #str.maketrans(Characters you want to 
                #replace, Characters that will replace them, Characters you want to delete)
            )

            review = review.translate(
                str.maketrans('', '', string.digits)
            )

            review = review.lower()

            review = ' '.join(
                word for word in review.split()
                if word not in self.stop_words
            )

            review = ' '.join(
                self.lemmatizer.lemmatize(
                    word,
                    self.get_wordnet_pos(word)
                )
                for word in review.split()
            )

            processed_reviews.append(review)

        return processed_reviews
    
preprocessor = Text_Preprocessor()
text1 = preprocessor.preprocess(text)
print(text1[:3])

print(amazon)

label = amazon['Label']
reviews = list(zip(text1, label))
reviews = pd.DataFrame (reviews, columns = ['amazon', 'label'])
reviews
reviews.head()

reviews = reviews.sample(frac=1, random_state=1).reset_index()
reviews.head()

## ------------ Split the Dataset ------------

#train dataset by splitting the data
train_reviews = reviews.amazon[:800]
train_sentiments = reviews.label[:800]

#test dataset
test_reviews = reviews.amazon[800:]
test_sentiments = reviews.label[800:]

print(train_reviews.shape,train_sentiments.shape)
print(test_reviews.shape,test_sentiments.shape)