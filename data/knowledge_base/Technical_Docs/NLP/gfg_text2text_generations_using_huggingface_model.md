# Text2Text Generations using HuggingFace Model

> Source: https://www.geeksforgeeks.org/nlp/text2text-generations-using-huggingface-model/

Text2text generation is a technique in Natural Language Processing (NLP) that allows us to transform input text into a different, task-specific output. It covers any task where an input sequence is transformed into another, context-dependent output. Tasks include:
- Translation to convert text between languages.
- Summarization for condensing verbose content.
- Paraphrasing with different wording.
- Extracting/generating answers from context.
- Assigning sentiment labels.
- Creating questions from statements.
Modern transformer models make this process both flexible and highly effective, especially when we use Hugging Face Transformers library.
Step-by-Step Implementation
Let's see the implementation of text2text generator using HuggingFace Model,
Step 1: Install Required Libraries
Use below command to install Hugging Face Transformers library
!pip install transformers
Step 2: Import and Prepare the Model
- Loads the tokenizer and model for google/flan-ul2 .
- Moves the model to GPU if available for much faster processing.
import torch
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
model_name = 'google/flan-ul2'
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForSeq2SeqLM.from_pretrained(model_name)
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
model = model.to(device)
Output:
Other models available are as follows:
- t5-base (balanced model size and accuracy)
- google/flan-t5-small
- google/flan-t5-xxl (instruction-tuned, better at following diverse prompts)
- facebook/bart-large (Great for summarization, paraphrasing and some translation tasks.)
- facebook/mbart-large-50-many-to-many-mmt (Handles many languages; requires more setup.)
- facebook/bart-large-cnn (Specialized for summarization)
- Vamsi/T5_Paraphrase_Paws (Paraphrasing)
- pszemraj/grammar-correction (Grammar correction)
- google/flan-ul2 (Very strong all-purpose instruction-following model)
Step 3: Use the generate_text Utility Function
def generate_text(task_prefix, input_text, max_length=64, num_beams=4):
    prompt = f"{task_prefix}: {input_text}"
    inputs = tokenizer(prompt, return_tensors="pt").to(device)
    output_ids = model.generate(
        **inputs,
        max_length=max_length,
        num_beams=num_beams,
        early_stopping=True,
        no_repeat_ngram_size=2
    )
    return tokenizer.decode(output_ids[0], skip_special_tokens=True)
Step 4: Give prompts and Check Result
1. Summarization
summary = generate_text(
    task_prefix="summarize",
    input_text="Natural language processing is a rapidly growing field enabling machines to understand and interact with human language."
)
print(summary)
Output:
Natural language processing enables machines to understand human language.
2. Translation
french_translation = generate_text(
    task_prefix="translate French to English",
    input_text="La bibliothèque HuggingFace Transformers met à disposition de puissants modèles AI, permettant ainsi une expérimentation et un déploiement rapides."
)
print(french_translation)
Output:
translate French to English: The HuggingFace Transformers library offers powerful AI models, allowing rapid experimentation and deployment.
3. Paraphrasing
paraphrase = generate_text(
    task_prefix="paraphrase",
    input_text="This library makes advanced AI accessible to everyone."
)
print(paraphrase)
Output:
This library allows everyone to use advanced AI.
4. Question-Generation
question = generate_text(
    task_prefix="generate question",
    input_text="The mitochondria is the powerhouse of the cell."
)
print(question)
Output:
What is the powerhouse of the cell?
5. Sentiment Analysis
result = generate_text(
    task_prefix="sst2 sentence",
    input_text="I had an amazing experience with the new smartphone"
)
print(result)
Output :
positive
We ca see that our Text2text generation model using hugging face is working fine.
