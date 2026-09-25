# What are Language Models in NLP?

> Source: https://www.geeksforgeeks.org/nlp/what-are-language-models-in-nlp/

Language models are an important part of NLP. They learn patterns in language and assign probabilities to word or token sequences, allowing them to predict the next token, complete sequences and estimate how likely a sequence is.
Mathematically, a language model estimates the probability of a sequence of words:
- where w_1,w_2,\ldots,w_n are the words or tokens in the sequence.
For next-token prediction:
- where w_t is the next token predicted from the preceding tokens.
Working
- Tokenization: The input text is divided into words, subwords or other tokens.
- Learning Language Patterns: The model is trained on text data to learn relationships and statistical patterns between tokens.
- Context Analysis: The model uses the available context to estimate the probability of possible tokens.
- Probability Estimation: It assigns probabilities to possible next tokens or sequences.
- Prediction: The most probable token or a token selected according to a decoding strategy, can be used to continue the sequence.
For example:
Input:  "She went to the
"Possible predictions:
market : 0.45
school : 0.30
office : 0.15
hospital : 0.06
park : 0.04
The model assigns different probabilities to these possible continuations based on patterns learned during training.
Types
Statistical Language Models
Statistical language models estimate the probability of a sequence using statistics collected from a training corpus. Traditional statistical approaches generally use a limited amount of preceding context.
1. N-gram Language Models: An n-gram language model predicts a word using a fixed number of preceding words. For example:
- Unigram: Considers one word at a time.
- Bigram: Uses the previous one word.
- Trigram: Uses the previous two words.
For example:
Given the sentence "I want to drink" a trigram model uses the previous two words, "want to", to predict the next word.
N-gram models are simple and relatively efficient, but their fixed context limits their ability to capture long-range dependencies. They can also suffer from data sparsity when particular word sequences are rare or absent from the training corpus.
2. Smoothing in N-gram Models: A problem with n-gram models is that an unseen sequence may receive a probability of zero. Smoothing techniques address this problem by adjusting probability estimates so that unseen or rare sequences can still receive a small probability. Common approaches include:
- Add-one (Laplace) smoothing
- Add-(k) smoothing
- Good-Turing smoothing
- Kneser-Ney smoothing
These techniques improve the robustness of statistical language models when dealing with sparse data.
Neural Language Models
- Neural language models use neural networks to learn distributed representations of words or tokens and estimate probabilities for language sequences.
- Unlike traditional n-gram models, neural models can learn more complex relationships between tokens and are not restricted to explicitly storing counts for every possible n-gram.
1. Feedforward Neural Language Models: Feedforward neural language models use a fixed number of preceding words as context. The words are represented as vectors and passed through neural network layers to predict the next word.
They improve upon traditional n-gram models by learning continuous word representations, but their fixed context still limits their ability to capture long-range dependencies.
2. Recurrent Neural Network Language Models: RNN language models process sequences step by step while maintaining a hidden state that carries information from previous tokens.
- This allows RNN-based language models to use information from earlier parts of a sequence when making predictions.
- However, basic RNNs can have difficulty learning long-range dependencies because of problems such as the vanishing-gradient problem.
3. LSTM Language Models: LSTM (Long Short-Term Memory) is a type of RNN designed to handle long-term dependencies more effectively. It uses gating mechanisms to control which information should be retained, updated or discarded. LSTM-based language models can:
- Retain relevant information across multiple time steps.
- Reduce the effect of the vanishing-gradient problem found in basic RNNs.
- Capture dependencies between words or tokens that are far apart in a sequence.
- Predict the next word or token in a sequence.
4. Transformer-Based Language Models: Transformers use attention mechanisms to model relationships between tokens in a sequence. Unlike recurrent models, they can process many tokens in parallel during training, making them more suitable for large-scale sequence modeling.
Transformer architectures can be used for different types of language modeling tasks, including:
- Autoregressive modeling: Predicting the next token based on previous tokens.
- Masked language modeling: Predicting tokens that have been masked within a sequence.
- Sequence-to-sequence modeling: Generating one sequence from another, such as in translation.
Examples include models based on architectures such as BERT, GPT and T5. Their specific architectures and applications differ, so they should not be treated as interchangeable types of language models.
Applications
- Text Completion and Generation: Predicting the next token and generating text from a given prompt.
- Machine Translation: Modeling likely word or token sequences to produce fluent translations.
- Speech Recognition: Using language probabilities to select likely word sequences from recognized speech.
- Autocomplete: Predicting likely words or phrases based on preceding context.
- Spelling and Grammar Correction: Identifying unlikely word sequences and suggesting appropriate alternatives.
- Question Answering: Modeling language context to generate or select relevant answers.
- Information Retrieval: Improving search by understanding query and document language patterns.
Limitations
- Data Dependence: Performance depends heavily on the quality, diversity and coverage of training data.
- Rare or Unseen Sequences: Statistical models may struggle with sequences that occur rarely or were not observed during training.
- Limited Context: Models with restricted context may fail to capture long-range dependencies.
- Bias: Models can learn and reproduce biases and undesirable patterns present in their training data.
- Hallucination: Generative language models can produce fluent and plausible-sounding information that is incorrect or unsupported by the input or training knowledge.
Language Models vs. Large Language Models
| Aspect | Language Model | Large Language Model (LLM) | 
|---|---|---|
| Definition | A general concept referring to a model that learns the probability structure of language. | A language model developed at a much larger scale. | 
| Scale | Can range from simple statistical models to neural models. | Typically trained on large datasets using substantial computational resources. | 
| Capabilities | Can predict, evaluate or generate language sequences. | Can perform these tasks at a much larger scale and support a wide range of NLP tasks. | 
| Relationship | Broad category that includes different types of language models. | A specific category of language model. |
