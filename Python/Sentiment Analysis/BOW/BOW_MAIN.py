# ==========================================
# Imports
# ==========================================
import os
import string
import contractions
import pandas as pd
import nltk
import matplotlib.pyplot as plt

from nltk.corpus import stopwords, wordnet
from nltk.stem import WordNetLemmatizer

from sklearn.feature_extraction.text import CountVectorizer
from sklearn.model_selection import train_test_split, cross_val_score

from sklearn.naive_bayes import GaussianNB
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import HistGradientBoostingClassifier
from sklearn.ensemble import BaggingClassifier
from sklearn.svm import SVC

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

# ==========================================
# Download NLTK Resources
# ==========================================
nltk.download("stopwords")
nltk.download("wordnet")
nltk.download("averaged_perceptron_tagger")

# ==========================================
# Create Reports Folder
# ==========================================
os.makedirs("reports", exist_ok=True)

# ==========================================
# Load Dataset
# ==========================================
amazon = pd.read_csv(
    "amazon_cells_labelled.txt",
    sep="\t",
    header=None,
    names=["Text", "Label"]
)

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
    test_size=0.20,
    random_state=42,
    stratify=amazon["Label"]
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
# Models
models = {

    "Decision Tree":
    DecisionTreeClassifier(
        criterion="entropy",
        random_state=42
    ),

    "Gaussian Naive Bayes":
    GaussianNB(),

    "HistGradientBoosting":
    HistGradientBoostingClassifier(
        random_state=42
    ),

    "Bagging SVM":
    BaggingClassifier(
        estimator=SVC(
            probability=True
        ),
        n_estimators=20,
        random_state=42
    )
}

# ==========================================
# Training & Evaluation
# ==========================================
results = []

fig, axes = plt.subplots(
    len(models),
    1,
    figsize=(8, 20)
)

for i, (name, model) in enumerate(models.items()):

    # HistGradientBoosting requires dense matrix
    if name in ["HistGradientBoosting", "Gaussian Naive Bayes"]:

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

        prob_input = X_test_bow.toarray()

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

        prob_input = X_test_bow

    accuracy = accuracy_score(
        y_test,
        predictions
    )

    precision = precision_score(
        y_test,
        predictions
    )

    recall = recall_score(
        y_test,
        predictions
    )

    f1 = f1_score(
        y_test,
        predictions
    )

    cm = confusion_matrix(
        y_test,
        predictions
    )

    report = classification_report(
        y_test,
        predictions,
        target_names=[
            "Negative",
            "Positive"
        ]
    )

    # Save individual report
    with open(
        f"reports/{name.replace(' ','_')}_report.txt",
        "w"
    ) as f:

        f.write("Confusion Matrix\n")
        f.write(str(cm))
        f.write("\n\nClassification Report\n")
        f.write(report)

    # ROC Curve
    if hasattr(model, "predict_proba"):

        probs = model.predict_proba(prob_input)[:,1]
        fpr, tpr, _ = roc_curve(y_test, probs)
        auc_score = roc_auc_score(y_test, probs)
        axes[i].plot(fpr, tpr, label=f"AUC = {auc_score:.3f}")
        axes[i].plot([0, 1], [0, 1], linestyle="--")
        axes[i].set_title(f"ROC Curve - {name}")
        axes[i].legend()

    results.append({

        "Model": name,
        "CV Accuracy": round(cv_score, 4),
        "Accuracy": round(accuracy, 4),
        "Precision": round(precision, 4),
        "Recall": round(recall, 4),
        "F1 Score": round(f1, 4)
    })

# ==========================================
# Save ROC Curves
# ==========================================
plt.tight_layout()

plt.savefig(
    "reports/roc_curves.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()

# ==========================================
# Save Results
# ==========================================
results_df = pd.DataFrame(
    results
).sort_values(
    by="Accuracy",
    ascending=False
)

# Save CSV
results_df.to_csv(
    "reports/model_comparision_results.csv",
    index=False
)

print("\nResults saved successfully.")