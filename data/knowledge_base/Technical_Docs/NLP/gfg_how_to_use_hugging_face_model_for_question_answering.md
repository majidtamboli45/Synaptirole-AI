# How to Use Hugging Face Model for Question Answering

> Source: https://www.geeksforgeeks.org/nlp/how-to-use-hugging-face-model-for-question-answering/

Using models from Hugging Face for question answering allows developers to build systems that can automatically extract answers from a given context. These pre-trained transformer models make it easy to implement NLP applications such as chatbots, document search and knowledge‑based QA systems..
Step 1: Set Up the Environment
- First, install the required libraries. Run the following command in your command prompt.
- This installs the Transformers library
pip install transformers torch
Step 2: Import Required Libraries
Import the pipeline from Transformers, as it provides a high-level interface that automatically manages tokenisation, model loading, inference and output formatting in a single streamlined workflow.
from transformers import pipeline
Step 3: Initialise the Question Answering Pipeline
Initialise the question answering pipeline by specifying the task and loading a pre-trained model (distilbert-base-cased-distilled-squad), which is already fine-tuned on the SQuAD dataset for answering questions from text.
qa_pipeline = pipeline(
    task="question-answering",
    model="distilbert-base-cased-distilled-squad"
)
Output:
Step 4: Define Context and Question
Create a context and a question. The model searches the context to find the answer. Before answering, it performs tokenization:
- Splits text into small tokens
- Analyzes relationships between them
- This helps the model understand the text and extract the correct answer.
context = """
GeeksforGeeks is a website that provides a wealth of resources for computer science enthusiasts and professionals.
It offers articles, tutorials and coding challenges on a variety of topics including algorithms, data structures, machine learning and web development.
The platform is designed to help users improve their coding skills and prepare for technical interviews.
GeeksforGeeks also features a community where users can ask questions, share knowledge and participate in discussions.
"""
question = "What does GeeksforGeeks provide?"
Step 5: Run the Model
Pass the question and context into the pipeline to generate the answer. Internally, the model:
- Tokenizes the input text
- Predicts the start and end positions of the answer
- Extracts the exact answer span from the context
result = qa_pipeline(
    question=question,
    context=context
)
Step 6: Display the Output
- score : Confidence level of the prediction
- start : Starting position of the answer in the text
- end : Ending position of the answer
- answer : Extracted response from the context
print(result)
Output:
{'score': 0.2661724090576172, 'start': 42, 'end': 114, 'answer': 'a wealth of resources for computer science enthusiasts and professionals'}
You can download the full code from here
