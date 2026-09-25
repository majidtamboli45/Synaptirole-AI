# Text Summarization using HuggingFace Model

> Source: https://www.geeksforgeeks.org/nlp/text-summarizations-using-huggingface-model/

Text summarization using models from Hugging Face allows developers to automatically generate concise summaries from long pieces of text. By using pretrained transformer models, it becomes easy to build applications that can extract key information and present it in a shorter, meaningful form. It has 2 components:
- Extractive : Selects important sentences directly from the text
- Abstractive : Generates new sentences that capture the same meaning
Implementation of Text Summarisation
Step 1: Set Up the Environment
- First, install the required libraries. Run the following command in your command prompt.
- This installs the Transformers library
pip install transformers torch
Step 2: Import Required Classes
- T5Tokenizer: Converts text into numerical tokens that the model can process
- T5ForConditionalGeneration: Generates new text based on the input
from transformers import T5Tokenizer, T5ForConditionalGeneration
Step 3: Load Pre-trained Model and Tokenizer
- T5 (Text-to-Text Transfer Transformer) handles every NLP task as a text transformation, it takes text as input and generates text as output.
- For summarization, it reads the full content and produces a shorter version. The model downloads automatically on first use.
model_name = "t5-small"
tokenizer = T5Tokenizer.from_pretrained(model_name)
model = T5ForConditionalGeneration.from_pretrained(model_name)
Output:
Step 4: Prepare Input Text
T5 works in an instruction based manner, so adding summarize tells the model what task to perform. Without this prefix, it won’t clearly know that it needs to generate a summary.
text = """
Artificial Intelligence is transforming industries across the globe.
From healthcare to finance, AI systems are automating processes,
analyzing data and improving decision making.
Organizations are investing heavily in AI research,
though ethical and privacy challenges remain.
"""
input_text = "summarize: " + text
Step 5: Tokenize the Input
Tokenization converts the text into numeric IDs the model can understand. Since the model processes numbers not raw words this step transforms the text into a format suitable for computation.
inputs = tokenizer.encode(
    input_text,
    return_tensors="pt",
    max_length=512,
    truncation=True
)
Step 6: Generate the Summary
- max_length: Sets the maximum summary length
- min_length: Avoids very short summaries
- num_beams=4: Uses beam search to improve output quality
- length_penalty: Maintains a balance between key details and conciseness.
- early_stopping=True: Stops when the best result is found
summary_ids = model.generate(
    inputs,
    max_length=60,
    min_length=20,
    length_penalty=2.0,
    num_beams=4,
    early_stopping=True
)
Step 7: Decoding the Output
The model generates numeric token IDs and decoding converts them back into readable text so you can see the final summary.
summary = tokenizer.decode(summary_ids[0], skip_special_tokens=True)
print("Summary:", summary)
Output:
Summary: AI systems are automating processes, analyzing data, and improving decision-making. organizations investing heavily in AI research, though ethical and privacy challenges remain.
You can download source code from here.
