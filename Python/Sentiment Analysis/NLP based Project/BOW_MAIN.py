# ==========================================
# Imports
# ==========================================
import pandas as pd
import string
import contractions
import nltk

from nltk.corpus import stopwords, wordnet
from nltk.stem import WordNetLemmatizer

from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.feature_extraction.text import CountVectorizer

from sklearn.naive_bayes import MultinomialNB
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import HistGradientBoostingClassifier
from sklearn.svm import SVC
from sklearn.ensemble import BaggingClassifier

from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    confusion_matrix,
    classification_report
)

# ==========================================
# Download NLTK Resources
# ==========================================
nltk.download("stopwords")
nltk.download("wordnet")
nltk.download("averaged_perceptron_tagger")

# ==========================================
# Load Dataset
# ==========================================
amazon = pd.read_csv(
    "amazon_cells_labelled.txt",
    sep="\t",
    header=None,
    names=["Text", "Label"]
)

print(amazon.head())

# ==========================================
# Text Preprocessing
# ==========================================
class TextPreprocessor:

    def __init__(self):
        self.stop_words = set(stopwords.words("english"))
        self.lemmatizer = WordNetLemmatizer()

    def get_wordnet_pos(self, word):

        tag = nltk.pos_tag([word])[0][1][0].upper()

        tag_dict = {
            "J": wordnet.ADJ,
            "N": wordnet.NOUN,
            "V": wordnet.VERB,
            "R": wordnet.ADV
        }

        return tag_dict.get(tag, wordnet.NOUN)

    def preprocess(self, reviews):

        processed_reviews = []

        for review in reviews:

            review = contractions.fix(review)

            review = review.translate(
                str.maketrans("", "", string.punctuation)
            )

            review = review.translate(
                str.maketrans("", "", string.digits)
            )

            review = review.lower()

            review = " ".join(
                word
                for word in review.split()
                if word not in self.stop_words
            )

            review = " ".join(
                self.lemmatizer.lemmatize(
                    word,
                    self.get_wordnet_pos(word)
                )
                for word in review.split()
            )

            processed_reviews.append(review)

        return processed_reviews


preprocessor = TextPreprocessor()

amazon["Processed_Text"] = preprocessor.preprocess(
    amazon["Text"]
)

# ==========================================
# Train Test Split
# ==========================================
X_train, X_test, y_train, y_test = train_test_split(
    amazon["Processed_Text"],
    amazon["Label"],
    test_size=0.2,
    random_state=42,
    stratify=amazon["Label"] #It preserves the same class distribution in train and test datasets.
)

# ==========================================
# Bag of Words
# ==========================================
vectorizer = CountVectorizer()

X_train_bow = vectorizer.fit_transform(X_train)

X_test_bow = vectorizer.transform(X_test)

print("Train Shape:", X_train_bow.shape)
print("Test Shape :", X_test_bow.shape)

# ==========================================
# Models
# ==========================================
models = {
    "Naive Bayes": MultinomialNB(),

    "Decision Tree": DecisionTreeClassifier(
        criterion="entropy",
        random_state=42
    ),

    "HistGradientBoosting":
    HistGradientBoostingClassifier(
        random_state=42
    ),

    "Bagging SVM":
    BaggingClassifier(
        estimator=SVC(probability=True),
        n_estimators=20,
        random_state=42
    )
}

# ==========================================
# Training & Evaluation
# ==========================================
results = []

for name, model in models.items():

    print("\n" + "="*50)
    print(name)
    print("="*50)

    # HistGradientBoosting requires dense data
    if name == "HistGradientBoosting":

        model.fit(
            X_train_bow.toarray(),
            y_train
        )

        predictions = model.predict(
            X_test_bow.toarray()
        )

        cv_score = cross_val_score(
            model,
            X_train_bow.toarray(),
            y_train,
            cv=5,
            scoring="accuracy"
        ).mean()

    else:

        model.fit(
            X_train_bow,
            y_train
        )

        predictions = model.predict(
            X_test_bow
        )

        cv_score = cross_val_score(
            model,
            X_train_bow,
            y_train,
            cv=5,
            scoring="accuracy"
        ).mean()

    accuracy = accuracy_score(y_test, predictions)
    precision = precision_score(y_test, predictions)
    recall = recall_score(y_test, predictions)
    f1 = f1_score(y_test, predictions)

    print("\nConfusion Matrix")
    print(confusion_matrix(y_test, predictions))

    print("\nClassification Report")
    print(
        classification_report(
            y_test,
            predictions,
            target_names=[
                "Negative",
                "Positive"
            ]
        )
    )

    results.append({
        "Model": name,
        "CV Accuracy": round(cv_score, 4),
        "Accuracy": round(accuracy, 4),
        "Precision": round(precision, 4),
        "Recall": round(recall, 4),
        "F1 Score": round(f1, 4)
    })

# ==========================================
# Results Table
# ==========================================
results_df = pd.DataFrame(results)

print("\nModel Comparison")
print(results_df.sort_values(
    by="Accuracy",
    ascending=False
))