# Imports
import os
import string
import contractions
import pandas as pd
import nltk
import matplotlib.pyplot as plt

from nltk.corpus import stopwords, wordnet
from nltk.stem import WordNetLemmatizer

from sklearn.model_selection import cross_val_score
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.decomposition import TruncatedSVD

from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB
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

# Download NLTK resources
nltk.download("stopwords")
nltk.download("wordnet")
nltk.download("averaged_perceptron_tagger")

# Create reports folder
os.makedirs("reports", exist_ok=True)

# Load Dataset
amazon = pd.read_csv(
    "amazon_cells_labelled.txt",
    sep="\t",
    header=None,
    names=["Text", "Label"]
)

# Text Preprocessing
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

# Train-Test Split
train_reviews = amazon["Processed_Text"][:800]
train_sentiments = amazon["Label"][:800]

test_reviews = amazon["Processed_Text"][800:]
test_sentiments = amazon["Label"][800:]

# Generate LSA Embeddings
def generate_lsa_embeddings(train_reviews, test_reviews, vector_size=100):
    tfidf = TfidfVectorizer()

    tfidf_train = tfidf.fit_transform(
        train_reviews
    )

    tfidf_test = tfidf.transform(
        test_reviews
    )

    svd = TruncatedSVD(
        n_components=vector_size,
        random_state=42
    )

    lsa_train = svd.fit_transform(
        tfidf_train
    )

    lsa_test = svd.transform(
        tfidf_test
    )

    return lsa_train, lsa_test


train_vectors, test_vectors = generate_lsa_embeddings(
    train_reviews,
    test_reviews,
    vector_size=100
)

# Models
classifiers = {

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

results = []

fig, axes = plt.subplots(
    len(classifiers),
    1,
    figsize=(8, 20)
)

for i, (name, model) in enumerate(
        classifiers.items()
):

    model.fit(
        train_vectors,
        train_sentiments
    )

    predictions = model.predict(
        test_vectors
    )

    accuracy = accuracy_score(
        test_sentiments,
        predictions
    )

    precision = precision_score(
        test_sentiments,
        predictions
    )

    recall = recall_score(
        test_sentiments,
        predictions
    )

    f1 = f1_score(
        test_sentiments,
        predictions
    )

    cv_score = cross_val_score(
        model,
        train_vectors,
        train_sentiments,
        cv=5,
        scoring="accuracy"
    ).mean()

    cm = confusion_matrix(
        test_sentiments,
        predictions
    )

    report = classification_report(
        test_sentiments,
        predictions,
        target_names=[
            "Negative",
            "Positive"
        ]
    )

    with open(
        f"reports/{name.replace(' ','_')}_report.txt",
        "w"
    ) as f:

        f.write("Confusion Matrix\n")
        f.write(str(cm))

        f.write(
            "\n\nClassification Report\n"
        )

        f.write(report)

    # ROC Curve
    if hasattr(model, "predict_proba"):

        probs = model.predict_proba(test_vectors)[:,1]
        fpr, tpr, _ = roc_curve(test_sentiments, probs)
        auc_score = roc_auc_score(test_sentiments, probs)
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

# Save ROC Curves
plt.tight_layout()

plt.savefig(
    "reports/roc_curves.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()

# Results Table
results_df = pd.DataFrame(
    results
).sort_values(
    by="Accuracy",
    ascending=False
)

# Save CSV
results_df.to_csv(
    "model_comparision_results.csv",
    index=False
)

print(
    "\nResults saved in reports folder."
)