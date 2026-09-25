# Perplexity for LLM Evaluation

> Source: https://www.geeksforgeeks.org/nlp/perplexity-for-llm-evaluation/

Perplexity is a metric that measures the uncertainty of a model's predictions. Specifically, in language models, it quantifies how well the model predicts the next word in a sequence. When a model makes a prediction, it assigns probabilities to possible next words.
Mathematically, perplexity is calculated as:
 
where 
Entropy measures the level of uncertainty in the model's output. Lower entropy means the model is more certain about its predictions and therefore, the perplexity is lower.
Perplexity indicates the level of confidence the model has in its prediction—lower perplexity suggests higher confidence and better performance in predicting the next word, while higher perplexity signals more uncertainty and less reliability. In simple terms, perplexity represents the number of potential options the model is considering when making its prediction.
Why is Perplexity Important for LLM Evaluation?
Perplexity is an important metric because it helps us assess how well a large language model (LLM) is predicting the next token in a sequence. Here's why perplexity matters:
- Prediction Accuracy: Perplexity gives insight into the accuracy of a model’s predictions. A low perplexity means the model is good at predicting words and likely generates coherent and fluent text.
- Confidence of the Model: It tells us how confident the model is in its predictions. If the perplexity is high, the model is likely uncertain about the next word, which could lead to incoherent text.
- Evaluation of Language Models: Perplexity helps evaluate language models like GPT-3, where predicting the next word or token is a crucial task. By using perplexity, we can determine whether a model is suitable for text generation, machine translation or summarization tasks.
How is Perplexity Calculated?
First, we need to compute the log probability of the model’s predictions for each word in the sequence. Here’s a simplified version of the process:
- Prediction of the Next Token: Language model predicts the probability of the next word based on the input text.
- Logarithmic Transformation: Log of the probability is taken and this helps transform the probability into a more useful measure.
- Average Log-Likelihood: Average log-likelihood of all predicted words in the test set is computed.
- Exponentiation to Get Perplexity: Final step is to exponentiate the average log-likelihood to get the perplexity score.
Perplexity for a sequence of words can be computed as:
where,
- p(w_i \mid w_{i-1}, \dots, w_1) is the predicted probability of thei^{\text{th}} word.
- N is the total number of words in the sequence.
This formula tells us how many words, on average, the model is choosing from when predicting the next word. A lower perplexity indicates fewer choices, meaning the model is more confident.
Calculating Perplexity for LLM Evaluation in Python
Step 1: Import Required Libraries
The first step is to import the necessary libraries. We need the torch library for handling tensor computations.
import torch
from transformers import AutoTokenizer, AutoModelForCausalLM
Step 2: Load Pre-Trained GPT-2 Model and Tokenizer
In this step, we load the pre-trained GPT-2 model and tokenizer.
- AutoTokenizer.from_pretrained(model_name): Loads the tokenizer for a pre-trained model.
- AutoModelForCausalLM.from_pretrained(model_name): Loads the language model for causal language modeling (GPT-2 in this case).
- tokenizer.pad_token = tokenizer.eos_token: Sets the end-of-sequence token (EOS) as the padding token, ensuring the model processes padding correctly.
# Load pre-trained GPT-2 model and tokenizer
model_name = "gpt2"
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(model_name)
# Assign the EOS token as the padding token
tokenizer.pad_token = tokenizer.eos_token
Step 3: Define the Perplexity Calculation Function
This function computes perplexity for a batch of input texts.
def compute_perplexity_for_batch(input_texts):
    inputs = tokenizer(
        input_texts, return_tensors="pt", padding=True, truncation=True
    )
    input_ids = inputs["input_ids"]
    attention_mask = inputs["attention_mask"]
    with torch.no_grad():
        outputs = model(input_ids, attention_mask=attention_mask)
        logits = outputs.logits
    shift_logits = logits[:, :-1, :] 
    shift_labels = input_ids[:, 1:] 
    log_probs = torch.nn.functional.log_softmax(shift_logits, dim=-1)
    target_log_probs = log_probs.gather(dim=-1, index=shift_labels.unsqueeze(-1)).squeeze(-1)
    target_log_probs = target_log_probs * attention_mask[:, 1:].to(log_probs.dtype)
    negative_log_likelihood = -target_log_probs.sum(dim=-1) / attention_mask[:, 1:].sum(dim=-1)
    perplexities = torch.exp(negative_log_likelihood)
    mean_perplexity_score = torch.mean(perplexities)
    return {
        "perplexities": perplexities.tolist(),
        "mean_perplexity": mean_perplexity_score.item()
    }
Step 4: Running the Example
Finally, we run the compute_perplexity_for_batch() function on a batch of input texts to compute and print the perplexity scores.
example_texts = [
    "Once upon a time, there was a brave knight.",
    "In a galaxy far, far away, a new adventure began."
]
# Compute perplexity scores for the batch of input texts
results = compute_perplexity_for_batch(example_texts)
print(f"Perplexity scores for each text: {results['perplexities']}")
print(f"Mean perplexity score: {results['mean_perplexity']}")
Output:
Perplexity scores for each text: [25.61, 18.61]
Mean perplexity score: 22.11
Interpreting the Results:
- Perplexity Score for Text 1: Perplexity for the sentence "Once upon a time, there was a brave knight." is 25.61, indicating that the model had moderate uncertainty in predicting the next word.
- Perplexity Score for Text 2: Sentence "In a galaxy far, far away, a new adventure began." has a lower perplexity score of 18.61, suggesting the model was more confident about predicting the next word.
- Mean Perplexity Score: Mean perplexity score for the batch of texts is 22.11, which gives an overall sense of how well the model performed on these two sentences.
Advantages of Perplexity
Perplexity offers several advantages, making it a widely-used metric for evaluating language models. Let's explore its key benefits:
- Intuitive Measure: Perplexity provides an easy-to-understand measure of model performance. It translates the model’s uncertainty into a human-readable form, telling us how many choices the model is considering for the next word.
- Real-Time Evaluation: Perplexity is calculated quickly and can be used during model training to instantly assess how well the model is performing.
- Useful for Fine-Tuning: Checking perplexity during fine-tuning helps developers see if the model is getting better at making confident predictions.
Limitations of Perplexity
Despite its advantages, perplexity has its limitations. While it’s an important metric, it doesn’t tell the full story. Let’s move into some of its challenges:
- Does Not Measure Understanding: A model with low perplexity may still produce incoherent or irrelevant text. Perplexity doesn't measure a model's understanding of the content, only its ability to predict the next word.
- Does Not Capture Long-Term Dependencies: Perplexity is based on immediate word predictions and may not capture longer-term dependencies or coherence across long sequences of text.
- Sensitive to Tokenization: A model tokenizes words can affect its perplexity score. For example, character-level models might have lower perplexity than word-level models, but that doesn't necessarily mean they are better at generating coherent text.
Using Perplexity Alongside Other Metrics
Perplexity is an essential evaluation metric for large language models (LLMs), but it is not enough to rely solely on perplexity when assessing a model’s performance. To get a more comprehensive view of how well a model is performing, it's crucial to use perplexity in combination with other metrics:
- BLEU, ROUGE, and METEOR : These metrics compare generated text against reference texts and are widely used in tasks like machine translation and summarization.
- Human Evaluation : Human judges assess the quality of generated text based on fluency, relevance, and coherence. While subjective, this approach provides insights into aspects that automated metrics cannot capture.
- Factual Accuracy : Tools like knowledge-based QA systems or fact-checking frameworks evaluate whether the model's outputs are factually correct.
- Diversity and Creativity : Metrics such as repetition rate, novelty score, and entropy assess the diversity of generated text.
- Bias and Fairness : Evaluating models for harmful biases and fairness ensures their safe deployment in real-world applications.
By combining perplexity with these additional metrics, we can better evaluate a model’s predictive accuracy, fluency and real-world usability. This combination allows us to detect models that not only predict correctly but also do so with confidence and coherence.
Real-World Applications of Perplexity
Let’s look at some practical scenarios where perplexity is widely used in the evaluation of language models:
- Text Generation: For generating coherent and fluent text, perplexity helps ensure the model's predictions are confident and make sense.
- Machine Translation: Perplexity can be used to assess how well a translation model predicts the next word in the target language, which is crucial for high-quality translations.
- Chatbots and Virtual Assistants: In conversational AI, a low perplexity ensures that responses are fluent and contextually appropriate, improving user experience.
- Summarization Models: In text summarization, perplexity helps evaluate how well the model predicts the next word in a summary, ensuring readability and coherence.
By incorporating perplexity into your evaluation pipeline, you can gain deeper insights into your model's predictive confidence, guiding further improvements and making your AI applications more reliable and efficient.
