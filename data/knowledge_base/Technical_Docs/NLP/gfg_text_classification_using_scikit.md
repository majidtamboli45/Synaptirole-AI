# Text Classification using scikit

> Source: https://www.geeksforgeeks.org/nlp/text-classification-using-scikit-learn-in-nlp/

The purpose of text classification, a key task in natural language processing (NLP), is to categorise text content into preset groups. Topic categorization, sentiment analysis, and spam detection can all benefit from this. In this article, we will use scikit-learn, a Python machine learning toolkit, to create a simple text categorization pipeline.
What is Text Classification?
Text classification is a fundamental task in natural language processing (NLP) that involves assigning predefined categories or labels to text documents. This process enables the automated sorting and organization of textual data, facilitating the extraction of valuable information and insights from large volumes of text. Text classification is widely used in various applications, including sentiment analysis, spam detection, topic labelling, and document categorization.
Why Use Scikit-learn for Text Classification?
- Ease of Use: User-friendly API and comprehensive documentation make it accessible for beginners and experts alike.
- Performance: Optimized for large datasets and efficient computation with robust model evaluation tools.
- Integration: Seamless integration with NumPy, SciPy, and pandas, plus support for creating streamlined workflows with pipelines.
- Community Support: Large, active community and frequent updates ensure continuous improvement and extensive resources for troubleshooting.
Implementation of Text Classification with Scikit-Learn
We'll categorize text using a straightforward example. Now let's look at a dataset of favorable and bad movie reviews.
Step 1: Import Necessary Libraries and Load Dataset
For this example, we'll use the 'sklearn.datasets.fetch_20newsgroups' dataset, which is a collection of newsgroup documents.
from sklearn.datasets import fetch_20newsgroups
import pandas as pd
# Load dataset
newsgroups = fetch_20newsgroups(subset='all', categories=['rec.sport.baseball', 'sci.space'], shuffle=True, random_state=42)
data = newsgroups.data
target = newsgroups.target
# Create a DataFrame for easy manipulation
df = pd.DataFrame({'text': data, 'label': target})
df.head()
Output:
    text    label
0 From: mss@netcom.com (Mark Singer)\nSubject: R... 0
1 From: cuz@chaos.cs.brandeis.edu (Cousin It)\nS... 0
2 From: J019800@LMSC5.IS.LMSC.LOCKHEED.COM\nSubj... 0
3 From: tedward@cs.cornell.edu (Edward [Ted] Fis... 0
4 From: snichols@adobe.com (Sherri Nichols)\nSub... 0
Step 2: Preprocess the Data
Term frequency-inverse document frequency, or TF-IDF, will be used to translate text into numerical vectors.
from sklearn.feature_extraction.text import TfidfVectorizer
# Initialize TF-IDF Vectorizer
vectorizer = TfidfVectorizer(stop_words='english', max_df=0.7)
# Transform the text data to feature vectors
X = vectorizer.fit_transform(df['text'])
# Labels
y = df['label']
Step 3: Fit the model for classification
We'll use a Support Vector Machine (SVM) for classification.
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
# Initialize and train the classifier
clf = SVC(kernel='linear')
clf.fit(X_train, y_train)
Output:
SVC
SVC(kernel='linear')
Step 4: Model Evaluation
Evaluate the model using accuracy score and classification report.
from sklearn.metrics import accuracy_score, classification_report
# Predict on the test set
y_pred = clf.predict(X_test)
# Evaluate the performance
accuracy = accuracy_score(y_test, y_pred)
report = classification_report(y_test, y_pred, target_names=newsgroups.target_names)
print(f'Accuracy: {accuracy:.4f}')
print('Classification Report:')
print(report)
Output:
Accuracy: 0.9966
Classification Report:
precision recall f1-score support
rec.sport.baseball 0.99 1.00 1.00 286
sci.space 1.00 0.99 1.00 309
accuracy 1.00 595
macro avg 1.00 1.00 1.00 595
weighted avg 1.00 1.00 1.00 595
Step 5: Define a Function to Predict Class for New Text
This code defines a function predict_category that takes a text input, vectorizes it using a pre-trained vectorizer, and predicts its category using a pre-trained classifier. The function then maps the predicted label to its corresponding category name from the newsgroups dataset. Finally, an example usage of the function is provided, demonstrating the prediction of a sample text about exoplanets.
def predict_category(text):
    """
    Predict the category of a given text using the trained classifier.
    """
    text_vec = vectorizer.transform([text])
    prediction = clf.predict(text_vec)
    return newsgroups.target_names[prediction[0]]
# Example usage
sample_text = "NASA announced the discovery of new exoplanets."
predicted_category = predict_category(sample_text)
print(f'The predicted category is: {predicted_category}')
Output:
The predicted category is: sci.space
Conclusion
In this article, we showed you how to use scikit-learn to create a simple text categorization pipeline. The first steps involved importing and preparing the dataset, using TF-IDF to convert text data into numerical representations, and then training an SVM classifier. Lastly, we assessed the model's effectiveness and offered a feature for categorising fresh textual input. Depending on the dataset and the requirements, this method can be modified to perform a variety of text classification tasks, including subject categorization, sentiment analysis, and spam detection.
