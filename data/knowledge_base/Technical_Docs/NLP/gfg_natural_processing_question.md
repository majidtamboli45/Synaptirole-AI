# Natural Language Processing  Question

> Source: https://www.geeksforgeeks.org/nlp/advanced-natural-language-processing-interview-question/

Natural Language Processing (NLP) is evolving rapidly, with interviews focusing not just on basics but also on advanced architectures, contextual understanding and real-world applications. Let's prepare for interviews with a few practice questions.
1. What is Natural Language Processing (NLP) and what are its core components?
Natural Language Processing (NLP) is a field of Artificial Intelligence that enables computers to understand, interpret, generate and interact using human language — text or speech. It sits at the intersection of linguistics, computer science and machine learning.
Core Components:
- Natural Language Understanding (NLU): Extracting meaning, intent and structure from text (e.g., parsing, entity recognition, sentiment analysis).
- Natural Language Generation (NLG): Producing coherent, human-like text from structured data or learned representations (e.g., summarization, dialogue generation).
- Speech Processing: Converting between speech and text (ASR, TTS) — often paired with NLP in voice assistants.
2. What is tokenization and what are its types?
Tokenization is the process of splitting text into smaller units called tokens, which can be words, subwords or characters. It is a fundamental step in NLP because most downstream tasks like embeddings, parsing and classification—require input in a structured, tokenized form.
Types of Tokenization:
- Word-level Tokenization: Splits text into individual words and it is used for most classic NLP tasks like text classification or POS tagging. 
Example: "NLP is fun" → ["NLP", "is", "fun"]
- Subword Tokenization: Splits words into meaningful subword units using methods like WordPiece or Byte-Pair Encoding (BPE) and it can handle rare/unknown words in language models; used in BERT, GPT.
Example: "unhappiness" → ["un", "happiness"]
- Character-level Tokenization: Splits text into characters and it is useful for languages with large vocabularies, misspellings or morphological analysis.
Example: "NLP" → ["N", "L", "P"]
- Sentence-level Tokenization: Splits text into sentences and it is useful in tasks like summarization or translation.
Example: "NLP is fun. It is evolving." → ["NLP is fun.", "It is evolving."]
3. What is the difference between stemming and lemmatization?
Stemming and Lemmatization are text preprocessing techniques used in Natural Language Processing (NLP) to reduce words to their base form. nary form (lemma).
Stemming
- Stemming removes prefixes or suffixes using predefined rules.
- It does not consider the word's meaning or context.
- The resulting word (stem) may not be a valid dictionary word.
- It is faster and computationally less expensive.
- Common stemming algorithms include Porter Stemmer, Snowball Stemmer, and Lancaster Stemmer.
- Goal: Reduce related words to a common stem for faster text processing.
Lemmatization
- Lemmatization converts a word to its dictionary base form (lemma).
- It uses vocabulary, morphology, and part-of-speech (POS) information.
- The output is always a valid dictionary word.
- It is more accurate but computationally slower than stemming.
- Common tools include WordNet Lemmatizer and spaCy Lemmatizer.
- Goal: Normalize words while preserving their actual meaning
4. What is the Out-of-Vocabulary (OOV) problem in NLP?
The OOV problem occurs when a model encounters a word not seen during training, leading to poor representation or prediction failure. This is a major challenge for traditional embedding methods like Word2Vec or GloVe, which assign vectors only to words present in the training corpus.
Example: Model trained on "I love NLP" may fail on "I enjoy NLU" because "NLU" is OOV.
Solutions:
- Subword embeddings: BPE, WordPiece break unknown words into known subwords.
- Character-level embeddings: Represent words via character sequences to handle rare/misspelled words.
- Contextual embeddings: Models like BERT or ELMo generate dynamic embeddings for any input, mitigating OOV issues.
5. What is the Bag of Words (BoW) model and what are its limitations?
Bag of Words (BoW) is a feature extraction technique that represents text as a vector of word counts or frequencies, ignoring grammar and word order. It’s simple and widely used in classic NLP pipelines.
Example:
- Sentence 1: "I love NLP" → [I:1, love:1, NLP:1]
- Sentence 2: "NLP love I" → [I:1, love:1, NLP:1]
- Both sentences have identical BoW representations because word order is ignored.
Limitations:
- Ignores word order: Cannot distinguish sentences with the same words but different meanings.
- No semantic understanding: Words like "good" and "excellent" are treated as unrelated.
- High dimensionality: For large vocabularies, the feature vectors can become sparse and memory-intensive.
- Does not handle OOV words: Words unseen during training are ignored.
6. What is TF-IDF and how is it used in NLP?
TF-IDF (Term Frequency-Inverse Document Frequency) is a statistical measure used in NLP to evaluate the importance of a word in a document relative to a collection of documents (corpus).
- Term Frequency (TF): Measures how often a word appears in a document, normalized by the total number of words in that document.
- Inverse Document Frequency (IDF): Measures how rare or informative a word is across all documents, reducing the weight of common words like "the" and increasing the weight of rare, meaningful words.
Formula:
TF-IDF(t,d) = TF(t,d)\times IDF(t) 
Applications:
- Feature extraction for classification tasks.
- Keyword extraction.
- Search engines and information retrieval.
7. What are N-gram Language Models?
An N-gram is a contiguous sequence of n words (or characters) from text. N-gram language models estimate the probability of a word based on the previous n-1 words, using the chain rule of probability with a Markov (limited-history) assumption.
Example (bigram model, n=2): P("NLP" | "love") — probability of "NLP" following "love", estimated from how often "love NLP" appears versus how often "love" appears in the corpus.
Types:
- Unigram: Considers each word independently.
- Bigram/Trigram: Considers 1–2 preceding words for context.
- Higher-order n-grams: Capture more context but suffer from data sparsity.
Limitations:
- Sparsity: Rare n-grams get poor probability estimates (mitigated with smoothing techniques like Laplace or Kneser-Ney smoothing).
- Limited context window: Cannot capture long-range dependencies, unlike RNNs or Transformers.
8. What are word embeddings and why are they important?
Word embeddings are dense vector representations of words in a continuous space, capturing semantic and syntactic relationships. Unlike one-hot vectors, embeddings encode similarity and contextual relationships between words.
Example: "king" and "queen" have vectors close together, reflecting their semantic similarity, whereas "king" and "apple" are distant.
Word Embedding Techniques:
- Word2Vec: Predicts words from context (CBOW) or context from word (Skip-gram).
- GloVe: Factorizes co-occurrence matrices to learn global statistical relationships.
- FastText: Embeds subwords to handle rare or misspelled words.
Importance:
- Captures semantic similarity beyond simple counts.
- Improves performance in NLP tasks like sentiment analysis, translation, text classification and semantic search.
- Reduces dimensionality while preserving meaning.
9. What is the difference between word embeddings and contextual embeddings?
Word Embeddings and Contextual Embeddings are vector representations of words used in Natural Language Processing (NLP).
Word Embeddings
- Word Embeddings represent each word as a fixed dense vector.
- The same word always has the same embedding, regardless of the sentence.
- They capture semantic relationships between words but cannot handle multiple meanings of a word (polysemy).
- They are pretrained and then used as static representations.
- Common examples include Word2Vec, GloVe, and FastText.
- Goal: Represent words in a dense vector space that captures semantic similarity.
Contextual Embeddings
- Contextual Embeddings generate a dynamic vector based on the word's surrounding context.
- The same word can have different embeddings in different sentences.
- They capture context, syntax, and multiple meanings of words.
- They are produced by transformer-based language models.
- Common examples include BERT, RoBERTa, GPT, ELMo, and DeBERTa.
- Goal: Learn context-aware word representations for better language understanding.
10. What are the different types of embeddings in NLP?
Let's see the various types of embeddings,
1. Word-level embeddings:
- Represent each word as a fixed vector.
- Examples: Word2Vec, GloVe.
- Use-case: Classic NLP tasks like similarity or classification.
2. Subword embeddings:
- Split words into meaningful sub-units to handle rare or unknown words.
- Examples: FastText, BPE, WordPiece.
- Use-case: Mitigates OOV problems, improves morphological understanding.
3. Character-level embeddings:
- Represent text at character granularity.
- Example: "running" → sequence of character vectors.
- Use-case: Morphologically rich languages, misspellings or rare words.
4. Contextual embeddings:
- Generate dynamic vectors for words based on surrounding text.
- Examples: BERT, ELMo, GPT.
- Use-case: Tasks like QA, NER and semantic disambiguation.
5. Sentence/document embeddings:
- Represent sentences or documents as single vectors.
- Examples: Universal Sentence Encoder, Sentence-BERT.
- Use-case: Semantic similarity, clustering, retrieval.
11. Dense vs. Sparse Embeddings
Dense and Sparse Embeddings are two ways of representing text or data as vectors.
Dense Embeddings
- Dense embeddings represent data as low-dimensional continuous vectors.
- Most vector elements have non-zero values.
- They capture semantic and contextual relationships between words or documents.
- Similar words have similar vector representations.
- They are learned using neural networks.
- Common examples include Word2Vec, GloVe, FastText, BERT embeddings, OpenAI embeddings, and Sentence Transformers.
- Goal: Capture semantic meaning in a compact vector representation.
Sparse Embeddings
- Sparse embeddings represent data as high-dimensional vectors.
- Most vector elements are zero.
- They capture explicit information such as word frequency or term importance.
- They are easy to interpret because each dimension often corresponds to a specific feature or word.
- Common examples include One-Hot Encoding, Bag of Words (BoW), TF-IDF, and BM25.
- Goal: Represent text based on explicit feature occurrences.
12. What is the difference between pretrained embeddings and fine-tuning?
Pretrained Embeddings and Fine-Tuning are two approaches for using pretrained language models in NLP.
Pretrained Embeddings
- Uses embeddings generated by a pretrained model without modifying its weights.
- The pretrained model acts as a fixed feature extractor.
- Requires less computational power and training data.
- Faster to deploy and suitable when labeled data is limited.
- Common models include Word2Vec, GloVe, FastText, BERT embeddings, and Sentence Transformers.
- Goal: Reuse general-purpose language representations for downstream tasks.
- Starts with a pretrained model and continues training it on a task-specific dataset.
- Updates some or all of the model's parameters.
- Adapts the model to a specific domain or application.
- Requires more computational resources and labeled data.
- Typically achieves higher performance on the target task.
- Commonly used with BERT, RoBERTa, GPT, T5, and LLaMA.
- Goal: Customize a pretrained model for a specific task
13. What are Recurrent Neural Networks (RNNs)?
Recurrent Neural Networks (RNNs) are a class of neural networks designed to handle sequential data, where the order of inputs is important. Unlike feedforward networks, RNNs maintain a hidden state that acts as memory, capturing information from previous time steps to influence current predictions.
Mathematical Representation:
h_t = f(W_{xh}x_t + W_{hh}h_{t-1} + b_h) 
- x_t  = input at time step t
- h_t  = hidden state at time step t
- f = activation function (e.g., tanh, ReLU)
Applications:
- Language modeling and text generation
- Machine translation
- Speech recognition
- Time-series forecasting
14. What is Backpropagation Through Time (BPTT)?
Backpropagation Through Time (BPTT) is the algorithm used to train RNNs. Since an RNN's hidden state at each time step depends on the previous one, the network is conceptually "unrolled" across all time steps into a long feedforward computation graph, and standard backpropagation is applied across this unrolled sequence.
How it works:
- The RNN is unrolled for the full input sequence length.
- A forward pass computes outputs and loss at each time step.
- Gradients are computed backward, from the last time step to the first, and accumulated for the shared weight matrices (since the same weights are reused at every step).
- Weights are updated using the accumulated gradients.
15. What is the vanishing gradient problem in RNNs?
The vanishing gradient problem occurs when gradients shrink exponentially as they are backpropagated through time steps in an RNN. This prevents the network from learning long-range dependencies effectively.
Example: If an RNN is trying to predict a word based on a sequence of 50 previous words, gradients may become extremely small by the time they reach the first word, leading to ineffective weight updates.
Solutions:
- LSTM (Long Short-Term Memory) networks with memory cells
- GRU (Gated Recurrent Units) with simplified gating
- Gradient clipping to prevent extremely small or large gradients
16. What is the difference between RNN, LSTM and GRU networks?
Recurrent Neural Networks (RNNs), Long Short-Term Memory (LSTM), and Gated Recurrent Units (GRUs) are neural network architectures designed for processing sequential data such as text, speech, and time-series.
Recurrent Neural Network (RNN)
- RNN processes sequential data by maintaining a hidden state that carries information from previous time steps.
- It captures short-term dependencies in sequences.
- Suffers from the vanishing/exploding gradient problem, making it difficult to learn long-term dependencies.
- Simpler architecture with fewer parameters.
- Used for basic sequence modeling tasks.
- Goal: Learn patterns in sequential data.
Long Short-Term Memory (LSTM)
- LSTM is an improved version of RNN designed to overcome the vanishing gradient problem.
- Effectively captures long-term dependencies.
- More accurate but computationally expensive.
- Commonly used for machine translation, speech recognition, and text generation.
- Goal: Learn long-term dependencies in sequential data.
17. Explain sequence-to-sequence (Seq2Seq) models and their components
Sequence-to-sequence (Seq2Seq) models are neural network architectures designed to transform an input sequence into an output sequence. They are widely used in NLP tasks where the lengths of input and output sequences can vary, such as machine translation, text summarization and speech recognition.
Components:
1. Encoder:
- Processes the input sequence and compresses it into a context vector, capturing the information of the entire sequence.
- An LSTM or GRU reads "I love NLP" and encodes it into a fixed-size vector representation.
2. Decoder:
- Generates the output sequence from the context vector.
- Predicts one token at a time, using the previously generated token as input.
3. Attention Mechanism :
- Allows the decoder to focus on specific parts of the input at each step, improving performance on longer sequences.
Example:
- Input: "I love NLP"
- Output (French): "J'aime le NLP"
Seq2Seq allows mapping variable-length input sequences to variable-length outputs, a crucial aspect in NLP tasks like translation.
18. What is an Encoder-Decoder model in NLP?
The Encoder-Decoder architecture is a foundational framework for sequence-to-sequence (Seq2Seq) tasks in NLP. It separates input comprehension and output generation, enabling flexible transformation of variable-length sequences.
Components:
Encoder:
- Processes the input sequence and compresses it into a context vector (dense representation).
- Often implemented using RNNs, LSTMs, GRUs or Transformer encoders.
Decoder:
- Generates the output sequence from the context vector, predicting one token at a time.
- Can use attention mechanisms to dynamically focus on relevant parts of the input.
Attention Layer:
- Enhances the decoder by weighting encoder outputs based on relevance to current decoding step.
Use-cases:
- Machine translation (English → French)
- Text summarization
- Chatbots and dialogue systems
Encoder-Decoder models provide a structured way to handle variable-length sequences, bridging input understanding with output generation.
19. What is the difference between Beam Search and Greedy Decoding?
Greedy Decoding and Beam Search are decoding strategies used in sequence generation models such as RNNs, LSTMs, Transformers, GPT, and machine translation models. Greedy Decoding selects the most probable token at each step, making it fast but often suboptimal.
Greedy Decoding
- Selects the highest-probability token at each decoding step.
- Makes a locally optimal decision without considering future possibilities.
- Maintains only one candidate sequence.
- Very fast and computationally efficient.
- May miss the globally optimal sequence.
- Goal: Generate text quickly with minimal computation.
- Maintains the top k most probable candidate sequences (beam width) at each decoding step.
- Expands all candidates and keeps the best k sequences based on their cumulative probabilities.
- Searches for a globally better sequence instead of making only local decisions.
- Produces more fluent and accurate outputs than greedy decoding.
- Slower and requires more memory than greedy decoding.
- Goal: Generate higher-quality sequences by exploring multiple alternatives.
20. Explain the Transformer architecture and its impact on NLP
Transformers process sequences in parallel using self-attention, instead of sequentially like RNNs. Self-attention weighs the importance of every word with respect to others, capturing long-range dependencies effectively.
Key Components:
- Self-Attention: Computes relationships between all words in a sequence simultaneously.
- Multi-Head Attention: Allows the model to focus on multiple aspects of context concurrently.
- Positional Encoding: Adds information about word order since attention itself is order-agnostic.
- Feed-Forward Layers: Non-linear transformations applied after attention for feature refinement.
- Layer Normalization & Residual Connections: Stabilizes training and improves gradient flow.
Impact on NLP:
- Enables parallelization, overcoming the sequential bottleneck of RNNs.
- Captures long-range dependencies efficiently.
- Forms the backbone of state-of-the-art models like BERT, GPT, T5, excelling in translation, summarization, text classification and QA.
Transformers outperform RNN-based architectures by modeling context more effectively and training faster on large corpora.
21. Give the difference between BERT and GPT architectures.
BERT (Bidirectional Encoder Representations from Transformers) and GPT (Generative Pre-trained Transformer) are Transformer-based language models, but they differ in architecture, training objectives, and use cases.
- Uses only the Transformer Encoder architecture.
- Processes text bidirectionally, considering both left and right context simultaneously.
- Pretrained using Masked Language Modeling (MLM) and Next Sentence Prediction (NSP) (in the original BERT).
- Designed primarily for language understanding tasks.
- Common applications include text classification, sentiment analysis, Named Entity Recognition (NER), question answering, and semantic search.
- Goal: Learn rich contextual representations for text understanding.
- Uses only the Transformer Decoder architecture.
- Processes text left-to-right (autoregressively), predicting one token at a time.
- Pretrained using Causal Language Modeling (CLM) (next-token prediction).
- Designed primarily for text generation.
- Common applications include chatbots, content generation, summarization, code generation, and translation.
- Goal: Generate coherent and contextually relevant text.
22. Autoregressive vs Autoencoder models.
Autoregressive and Autoencoder models are two major approaches used in Generative AI.
- Generate output sequentially, predicting one token at a time.
- Each prediction depends on the previously generated tokens.
- Trained using next-token prediction (causal language modeling).
- Excellent for generating coherent text.
- Inference is slower because tokens are generated sequentially.
- Common examples include GPT, Llama, Claude, and Mistral.
- Goal: Learn the probability distribution of sequences to generate new data.
- Consist of an Encoder and a Decoder.
- The Encoder compresses the input into a latent representation, and the Decoder reconstructs the original input.
- Trained using reconstruction loss.
- Learn meaningful feature representations rather than generating text token by token.
- Can generate new samples by decoding latent vectors (e.g., Variational Autoencoders (VAEs)).
- Common examples include Autoencoders, Variational Autoencoders (VAEs), and Denoising Autoencoders.
- Goal: Learn compact representations and reconstruct or generate data.
23. What are the differences between Masked Language Modeling (MLM) and Causal Language Modeling (CLM)?
Masked Language Modeling (MLM) and Causal Language Modeling (CLM) are two common pretraining objectives for Transformer-based language models.
Masked Language Modeling (MLM)
- Randomly masks some words in the input sentence.
- The model predicts the masked words.
- Uses bidirectional context (both left and right words).
- Typically implemented using Transformer Encoders.
- Best suited for language understanding tasks.
- Common models include BERT, RoBERTa, ALBERT, and DeBERTa.
- Goal: Learn rich contextual representations by understanding the entire sentence.
Causal Language Modeling (CLM)
- Predicts the next token in a sequence.
- Uses only the left (previous) context.
- Text is generated autoregressively, one token at a time.
- Typically implemented using Transformer Decoders.
- Best suited for text generation tasks.
- Common models include GPT, Llama, Mistral, and Claude.
- Goal: Learn to generate coherent text by modeling the probability of the next token.
24. What is Perplexity in NLP?
Perplexity is the standard intrinsic evaluation metric for language models it measures how well a probability model predicts a sample of text. Intuitively, it captures how "surprised" the model is by the actual next word; lower perplexity means a better language model.
Formula: PP(W) = P(w1, w2, ..., wN)^(-1/N)
where P(w1...wN) is the probability the model assigns to the sequence of N words. Equivalently, perplexity is 2 raised to the cross-entropy loss (in bits), so it's directly tied to the training/validation loss of a language model.
Limitations:
- Perplexity is corpus/tokenizer-dependent, so scores aren't always comparable across models with different vocabularies.
- It measures fluency/predictiveness, not factual correctness — a model can have low perplexity while still generating false or nonsensical statements.
25. What is Part-of-Speech (POS) Tagging and why is it important?
Part-of-Speech (POS) Tagging is the process of assigning each word in a sentence its grammatical category — noun, verb, adjective, adverb, pronoun, preposition, etc. — based on both its definition and its context in the sentence.
Example: Sentence: "Data science combines statistics and machine learning." Tags: Data (NNP), science (NN), combines (VBZ), statistics (NNS), and (CC), machine (NN), learning (NN)
Approaches:
- Rule-based tagging: Uses handcrafted linguistic rules (e.g., a word following "the" is likely a noun).
- Statistical tagging: Uses probabilistic models like Hidden Markov Models (HMMs) trained on tagged corpora.
- Neural tagging: Uses RNNs, CRFs or Transformer-based models for higher accuracy, especially with ambiguous words.
26. How does dependency parsing differ from constituency parsing?
Dependency Parsing and Constituency Parsing are two syntactic parsing techniques in Natural Language Processing (NLP) used to analyze sentence structure.
Dependency Parsing
- Represents a sentence as a dependency tree.
- Each word depends on another word (its head) through a grammatical relationship.
- The edges represent relationships such as subject, object, modifier, etc.
- Focuses on word-to-word dependencies rather than phrase structure.
- Produces a simpler and more compact representation.
- Commonly used for information extraction, relation extraction, machine translation, and question answering.
- Goal: Identify grammatical relationships between words.
Constituency Parsing
- Represents a sentence as a hierarchical phrase structure tree (parse tree).
- Shows how phrases combine to form a complete sentence.
- Provides a detailed hierarchical representation of sentence structure.
- Commonly used in grammar checking, syntax analysis, and sentence generation.
- Goal: Identify the hierarchical phrase structure of a sentence.
27. What are positional encodings in Transformers and why are they needed?
Transformers process sequences in parallel and do not inherently capture the order of tokens. Positional encodings add information about the position of each token in the sequence, enabling the model to recognize the relative or absolute position of words.
Types of Positional Encodings:
- Sinusoidal (fixed) encoding: Uses sine and cosine functions of different frequencies.
- Learned encoding: Position embeddings are learned during training.
Why Needed:
- Without positional encodings, a Transformer cannot distinguish "I love NLP" from "NLP love I".
- Enables modeling of sequential patterns and relationships between words.
28. Explain Named Entity Recognition (NER) and its importance
Named Entity Recognition (NER) is a subtask of information extraction that identifies and classifies entities in text into predefined categories such as persons organizations, locations, dates, monetary values, percentages and more.
- Entity Recognition: Detecting the presence of an entity in the text.
- Entity Classification: Assigning the detected entity to a predefined category.
Example:
Sentence: "Apple Inc. was founded by Steve Jobs in Cupertino."
NER Output:
- "Apple Inc." → Organization
- "Steve Jobs" → Person
- "Cupertino" → Location
Importance of NER:
- Information Retrieval: Improves search accuracy by identifying key entities.
- Question Answering Systems: Helps extract relevant facts from documents.
- Content Recommendation: Enhances understanding of text content for personalization.
- Knowledge Graph Construction: Extracts structured information from unstructured text.
29. What is Coreference Resolution in NLP?
Coreference Resolution is the task of identifying all expressions in a text that refer to the same real-world entity, and linking them together. This includes resolving pronouns and other referring expressions back to the entity they represent.
Example: "Sundar Pichai leads Google. He has held the role since 2015. The company is headquartered in California." Here, "He" refers to "Sundar Pichai" and "The company" refers to "Google" — a coreference resolver links all three mentions.
Types:
- Pronominal resolution: Linking pronouns ("he", "she", "it") to their antecedents.
- Nominal resolution: Linking different noun phrases referring to the same entity ("the company", "the tech giant").
30. What is Word Sense Disambiguation (WSD)? Differentiate between WSD and NER.
Word Sense Disambiguation (WSD) and Named Entity Recognition (NER) are two important tasks in Natural Language Processing (NLP).
Word Sense Disambiguation (WSD)
- WSD identifies the correct meaning of a word when it has multiple possible meanings.
- It uses the surrounding context to resolve ambiguity.
- Helps improve semantic understanding of text.
- Common approaches include knowledge-based, supervised, and unsupervised methods.
- Applications include machine translation, question answering, information retrieval, and text understanding.
- Goal: Assign the correct sense to an ambiguous word.
Named Entity Recognition (NER)
- NER identifies and classifies named entities in text.
- It focuses on identifying proper nouns and specific entities, not word meanings.
- Commonly implemented using BiLSTM-CRF, BERT, RoBERTa, and other Transformer models.
- Applications include information extraction, search engines, chatbots, and document analysis.
- Goal: Detect and classify named entities in text.
31. What is topic modeling and which algorithms are commonly used?
Topic modeling is an unsupervised learning technique that identifies hidden topics in large collections of text documents by analyzing word patterns and co-occurrences.
Common Algorithms:
- Latent Dirichlet Allocation (LDA): Probabilistic model that represents documents as mixtures of topics and topics as distributions of words.
- Non-negative Matrix Factorization (NMF): Factorizes document-term matrices into topic-word and document-topic matrices.
- BERTopic: Transformer-based approach that leverages contextual embeddings for richer topic representations.
Applications:
- Trend analysis and market research
- Document clustering and organization
- Summarization and content recommendation
32. What is information extraction (IE)?
Information Extraction (IE) is the process of automatically converting unstructured text into structured data that can be easily analyzed and used in downstream applications. IE allows systems to extract meaningful facts, entities, relationships and events from raw text.
Key Components:
- Named Entity Recognition (NER): Identify and classify entities (persons organizations, locations, etc.)
- Relation Extraction: Detect relationships between entities (e.g., “Steve Jobs → founder → Apple Inc.”)
- Event Extraction: Identify events and participants, along with temporal and spatial details
Applications:
- Knowledge Graph Construction: Populating structured graphs for reasoning and search.
- Question Answering Systems: Extracting precise answers from large text corpora.
- Content Summarization: Automatically summarizing key information from articles.
- Data Analytics: Structuring unstructured textual data for insights.
33. What are the challenges faced in sentiment analysis and how can they be addressed?
Sentiment analysis determines the emotional tone of text (positive, negative, neutral), but it faces several challenges:
1. Sarcasm and Irony:
- Sentences may convey the opposite sentiment of literal words.
- Example: "Great job!" could be sarcastic and actually negative.
- Solution: Use contextual embeddings like BERT or specific sarcasm detection models that can capture nuanced meaning.
2. Contextual Ambiguity:
- Words can have different sentiment depending on context.
- Example: "The movie was good, but the ending was disappointing."
- Solution: Fine-tune context-aware architectures like Transformers to understand subtle shifts in sentiment.
3. Domain-Specific Language:
- Words can carry different sentiment in specialized domains.
- Example: "Positive" in a medical report vs. a movie review.
- Solution: Use domain-specific datasets for training or fine-tuning.
4. Negation Handling:
- Negations can flip sentiment.
- Example: "I don’t like this movie."
- Solution: Incorporate syntactic parsing or negation-aware embeddings.
5. Imbalanced Data:
- Some sentiment classes may dominate the dataset, biasing predictions.
- Solution: Apply data augmentation, class weighting or resampling techniques
34. What are common challenges in text classification and how can they be solved?
Text classification assigns predefined categories to text documents, but it faces multiple challenges:
High Dimensionality:
- Text represented with large vocabularies leads to sparse feature spaces.
- Solution: Use dimensionality reduction methods like TF-IDF with PCA or dense embeddings such as Word2Vec or BERT.
Class Imbalance:
- Some categories have significantly fewer examples, causing biased models.
- Solution: Use oversampling, undersampling or weighted loss functions to balance training.
Noise and Irrelevant Information:
- Text may contain typos, stopwords or unrelated content.
- Solution: Perform preprocessing steps like tokenization, stopword removal and normalization.
Ambiguity:
- Words with multiple meanings can confuse the classifier.
- Solution: Employ contextual embeddings (e.g., BERT, ELMo) to capture word meaning in context.
Domain Adaptation:
- Models trained on one domain may not generalize to another.
- Solution: Apply transfer learning and fine-tune models on target domain data.
35. How do attention mechanisms work in NLP?
Attention mechanisms in NLP allow models to focus on relevant parts of the input sequence when processing or generating text. Each word is assigned a weight based on its importance to other words in the sequence, enabling the model to capture context and long-range dependencies effectively.
- Self-Attention: Computes relevance of each word with every other word in the sequence.
- Scaled Dot-Product Attention: Uses the dot product of queries and keys, scaled and applied to values to determine attention weights.
- Multi-Head Attention: Uses multiple attention heads to capture different aspects of relationships simultaneously.
36. What is the role of Layer Normalization in Transformer models?
Layer Normalization is a technique that normalizes the inputs of each layer to have zero mean and unit variance, stabilizing and accelerating training in deep neural networks, particularly Transformers.
- Prevents vanishing/exploding gradients.
- Applied to self-attention and feed-forward layers.
- Variants: Pre-LayerNorm (before operations) and Post-LayerNorm (after operations).
Layer Normalization ensures stable and efficient training, improving convergence and model performance.
37. What is the role of context windows in NLP?
A context window is the set of words surrounding a target word that a model considers when interpreting its meaning. It defines the scope of context used to capture semantic and syntactic relationships.
Types:
- Narrow Window: Focuses on immediate neighbors; captures local syntactic relationships.
- Wide Window: Includes distant words; captures long-range semantic dependencies.
- Dynamic/Adaptive Window: Context is learned dynamically, as in Transformers, via attention.
38. What is zero-shot and few-shot learning in NLP?
Zero-shot learning in NLP refers to the ability of a model to perform a task without having seen any labeled examples of that task during training, relying solely on its pre-trained knowledge.
For Example: A sentiment analysis model trained on English being used to classify sentiments in Hindi without explicit Hindi training data.
Few-shot learning refers to the ability of a model to adapt to a task with only a small number of labeled examples, leveraging prior knowledge for generalization. For example: Fine-tuning a pre-trained model for intent classification with just a handful of labeled sentences.
39. Explain Cross-lingual Transfer Learning and its challenges.
Cross-lingual Transfer Learning is the process of using knowledge learned from a high-resource source language (e.g., English) to improve model performance in a low-resource target language (e.g., Swahili), enabling multilingual applications with limited labeled data.
- Utilizes multilingual embeddings and pre-trained models like mBERT or XLM-R.
- Enables tasks like machine translation, sentiment analysis and question answering across languages.
Challenges:
- Language diversity: Structural and syntactic differences hinder transfer.
- Data scarcity: Limited parallel corpora for many languages.
- Domain mismatch: Source and target may differ in usage contexts.
- Cultural nuances: Idioms and semantics vary across languages.
- High computation costs: Multilingual models are large and resource-intensive.
40. What is retrieval-augmented generation (RAG) in NLP?
Retrieval-Augmented Generation (RAG) is a hybrid NLP approach that combines retrieval-based methods with generative models to improve accuracy, factuality and knowledge coverage in text generation tasks.
- The retriever component fetches relevant documents or passages from an external knowledge source (e.g., Wikipedia, a vector database).
- The generator (usually a Transformer-based model like BART or GPT) uses both the retrieved context and its own learned knowledge to produce the final output.
- This helps reduce hallucinations and improves performance on tasks requiring factual grounding.
Applications:
- Open-domain question answering
- Chatbots with external knowledge integration
- Summarization with verified context
- Legal, financial and medical document assistance
RAG enhances generative models by anchoring responses in real-world data, making them more reliable and trustworthy.
41. How can knowledge graphs be integrated into NLP applications?
A knowledge graph (KG) is a structured representation of entities and their relationships. Integrating KGs into NLP allows models to use explicit symbolic knowledge alongside statistical learning for better reasoning and interpretability.
- Entity Linking: Mapping text mentions to KG entities (e.g., “Apple” → company vs fruit).
- Relation Extraction: Using KGs to validate or discover relationships between entities.
- KG-Enhanced Embeddings: Incorporating KG structure into word or sentence embeddings for semantic enrichment.
- Hybrid Models: Combining KGs with neural architectures (e.g., Graph Neural Networks + Transformers).
Applications:
- Question Answering: Providing factual, graph-based answers.
- Recommendation Systems: Leveraging entity relationships for personalized recommendations.
- Semantic Search: Improving retrieval accuracy with KG-based reasoning.
- Dialogue Systems: Maintaining consistency and factual grounding in conversations.
42. Describe how you would implement a chatbot using NLP techniques.
A chatbot is an AI system that simulates human conversation, often using Natural Language Processing (NLP) to understand user input and generate appropriate responses.
Implementation Steps:
1. Text Preprocessing
- Clean input (tokenization, stopword removal, stemming/lemmatization).
- Handle spelling correction and entity recognition for better interpretation.
2. Intent Recognition
- Use text classification models (e.g., logistic regression, SVM or deep learning models like BERT) to identify user intent (e.g., "book flight," "check weather").
3. Entity Extraction
- Apply Named Entity Recognition (NER) to capture required entities (e.g., dates, names, locations).
4. Dialogue Management
- Rule-based (dialogue flow charts, if-else rules).
- Machine learning-based (Reinforcement Learning or Transformer-based dialogue policies).
5. Response Generation
- Retrieval-based: Predefined responses based on matching.
- Generative-based: Neural models (e.g., Seq2Seq, Transformer, GPT) generate responses dynamically.
- Hybrid approach (retrieval + generative).
6. Knowledge Integration
- Incorporate knowledge graphs or retrieval-augmented generation (RAG) to improve factual accuracy.
Application:
- Banking chatbot (checking balances, transaction history).
- Customer support (handling FAQs).
- Healthcare chatbot (symptom checker with disclaimers).
43. What are machine translation approaches?
Machine Translation (MT) refers to the process of automatically converting text or speech from one natural language into another using computational methods.
1. Rule-Based Machine Translation (RBMT):
RBMT is the earliest approach to MT, which relies on explicit linguistic rules and bilingual dictionaries crafted by experts. It uses knowledge of grammar, syntax and semantics of both the source and target languages to perform translation.
- Pros: Grammatically precise for structured sentences.
- Cons: Requires extensive manual effort, struggles with ambiguity and idioms.
2. Statistical Machine Translation (SMT):
SMT relies on probability and statistics derived from large bilingual corpora to generate translations. Instead of rules, it learns how words and phrases in one language map to another based on frequency and alignment.
- Example: Phrase-Based SMT learns phrase mappings from aligned sentences.
- Pros: More flexible than RBMT, learns from data.
- Cons: Still limited in fluency and long-range dependencies.
3. Neural Machine Translation (NMT):
NMT uses deep learning models, particularly sequence-to-sequence architectures with attention (and later Transformers), to perform translation. It represents words and sentences in continuous vector spaces (embeddings), enabling context-aware and fluent translations.
- Pros: Produces fluent, context-aware translations.
- Cons: Requires large data and compute resources, may hallucinate translations.
44. What is the difference between Extractive and Abstractive Text Summarization?
Text summarization condenses a document into a shorter version while preserving its key information. There are two broad approaches:
Extractive Summarization: Selects and stitches together the most important existing sentences or phrases directly from the source text, without altering their wording.
- Techniques: TF-IDF/word-frequency scoring, TextRank (graph-based ranking similar to PageRank), sentence embedding similarity + clustering.
- Pros: Grammatically correct by construction (uses original sentences), factually safe, faster.
- Cons: Can be disjointed and lack the fluency of human-written summaries.
Abstractive Summarization: Generates new sentences that paraphrase and condense the meaning of the source text, similar to how a human would summarize.
- Techniques: Seq2Seq models with attention, Transformer-based models like BART, T5, PEGASUS.
- Pros: More fluent, human-like and concise summaries.
- Cons: More prone to hallucination (generating facts not present in the source); harder to train and evaluate.
45. How can NLP be applied in recommendation systems, search engines and QA systems?
1. NLP in Recommendation System
A recommendation system is an AI-based system that predicts and suggests items (such as products, movies or news articles) to users by analyzing their past interactions, preferences and available content.
How NLP is applied:
- Analyzing product/movie descriptions using embeddings.
- Understanding user feedback via sentiment analysis.
- Extracting key themes through topic modeling.
- Capturing user intent from natural language queries (e.g., “affordable phones for photography”).
2. NLP in Search Engines
A search engine is a system that retrieves and ranks relevant documents, web pages or content based on a user’s query. NLP improves search engines by enabling them to understand the meaning behind queries instead of just matching keywords.
How NLP is applied:
- Query processing: Tokenization, stemming and lemmatization make queries more precise.
- Semantic search: Embedding-based retrieval (e.g., BERT, SBERT) allows searches by meaning, not exact words.
- Entity recognition: Identifying names, places or dates in queries.
- Re-ranking models: NLP-powered ranking ensures that the most relevant documents appear at the top.
- Conversational search: Handles follow-up and context-aware queries.
3. NLP in Question Answering (QA) Systems
A QA system is an NLP-powered application that provides direct answers to user queries expressed in natural language, instead of returning just a list of documents. Unlike search engines, QA systems aim to extract or generate exact responses from available knowledge.
How NLP is applied:
- Extractive QA: Models like BERT highlight the exact span of text containing the answer.
- Generative QA: GPT-like models generate natural language answers.
- Knowledge graph QA: Uses structured graphs to answer factual queries.
- Conversational QA: Context-aware systems that manage follow-up questions.
- Domain-specific QA: Trained on specialized datasets for medicine, law or finance.
46. What are the evaluations metrics in NLP?
Evaluation metrics in NLP vary by task and generally include:
Classification Tasks:
- Accuracy: Overall correctness of predictions
- Precision: Proportion of correctly predicted positive instances
- Recall: Proportion of actual positives correctly identified
- F1-Score: F1-Score is harmonic mean of precision and recall, balancing both
Machine Translation:
- BLEU (Bilingual Evaluation Understudy): Measures n-gram overlap between generated and reference text
- ROUGE (Recall-Oriented Understudy for Gisting Evaluation): Emphasizes recall of overlapping units, used also for summarization
Summarization:
- ROUGE: Commonly used metric for overlap with reference summaries
- BERTScore: Uses contextual embeddings to evaluate semantic similarity beyond exact word matches
Semantic Similarity:
- Cosine Similarity: Measures angle-based similarity between vector embeddings of sentences or words
- Word Mover’s Distance (WMD): Quantifies semantic distance based on optimal transport between word embeddings
47. What is cosine similarity and Word Mover’s Distance (WMD) in semantic similarity?
Semantic similarity refers to measuring how closely two texts (words, sentences or documents) are related in meaning. Two popular approaches for this are cosine similarity and Word Mover’s Distance (WMD).
Cosine Similarity:
Cosine similarity is a vector-based metric that measures the cosine of the angle between two vectors in high-dimensional space. It captures how similar the direction of two vectors is, regardless of their magnitude.
- Represents words, sentences or documents as embeddings (numerical vectors).
- Computes similarity based on vector orientation.
Formula:
\text{Cosine Similarity}= \frac{A.B}{||A||\times||B||} 
where 
Use cases:
- Semantic search (matching queries with documents).
- Document clustering.
- Recommender systems based on text similarity.
Word Mover’s Distance (WMD):
Word Mover’s Distance is a document-level distance metric that measures the minimum cumulative distance required to move words from one text to another, using their embeddings. It is based on the Earth Mover’s Distance (optimal transport theory).
- Represents each word in both documents as embeddings.
- Calculates how much "effort" is needed to transform one document into the other by optimally matching and moving words.
- Accounts for semantic similarity between words (e.g., “Obama” and “President” are close in embedding space).
Advantages over cosine similarity:
- Captures fine-grained word-to-word relationships instead of just comparing overall vectors.
- Better at handling paraphrases or semantically equivalent but differently worded sentences.
Example:
- Sentence 1: “Obama speaks to the press.”
- Sentence 2: “The President gives a speech.”
48. What is pragmatic ambiguity?
Pragmatic ambiguity occurs when the meaning of an utterance depends on the context, situation or speaker intent, rather than the literal interpretation of the words themselves. It arises from how language is used in communication, not from grammatical or lexical ambiguity.
- Unlike lexical ambiguity (where a word has multiple meanings, e.g., “bank”), pragmatic ambiguity involves interpretation based on context.
- It can lead to multiple valid readings of the same sentence depending on the speaker, listener or situation.
Examples:
1. “Can you pass the salt?”
- Literal interpretation: Asking if the listener is able to pass the salt.
- Pragmatic interpretation: Polite request for the salt.
2. “I’ll meet you at the bank.”
- Without context, it could refer to a financial institution or the side of a river.
- The context (river vs city) resolves the ambiguity.
49. What are Hugging Face Transformers and how are they used in NLP?
Hugging Face Transformers is an open-source library that provides pretrained Transformer-based models for a wide range of NLP tasks. It enables easy access to models like BERT, GPT, RoBERTa, T5, and DistilBERT, along with tools for training, fine-tuning, and deploying them efficiently.
Key Features:
- Pretrained Models: Hundreds of models trained on large corpora, ready for downstream tasks.
- Task Support: Includes text classification, token classification, question answering, summarization, translation, and text generation.
- Easy Integration: Works with PyTorch, TensorFlow, and JAX.
- Tokenizers: Supports subword tokenization like WordPiece, BPE, and SentencePiece.
- Fine-Tuning: Allows adapting pretrained models to domain-specific tasks with minimal code.
Applications in NLP:
- Text Classification: Sentiment analysis, spam detection, topic classification.
- Named Entity Recognition (NER): Identifying entities like names, dates, locations.
- Question Answering (QA): Extractive and generative QA systems.
- Text Generation: Chatbots, story generation, summarization.
- Translation and Summarization: Multilingual and abstractive text processing.
50. Apply a full text preprocessing pipeline.
Text preprocessing is the process of cleaning and transforming raw text into a structured format suitable for NLP tasks. It helps remove noise, standardize the input and prepare features for downstream models. Using NLTK (Natural Language Toolkit), we can implement a complete preprocessing pipeline.
1. Import Necessary Libraries
We will be importing nltk, regex, string and inflect.
import nltk
import string
import re
import inflect
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from nltk.stem.porter import PorterStemmer
2. Convert to Lowercase
We convert the text lowercase to reduce the size of the vocabulary of our text data.
def text_lowercase(text):
    return text.lower()
input_str = "Hey, did you know that the summer break is coming? Amazing right !! It's only 5 more days !!"
print(text_lowercase(input_str))
Output:
hey, did you know that the summer break is coming? amazing right !! it's only 5 more days !!
3. Removing Numbers
We can either remove numbers or convert the numbers into their textual representations. To remove the numbers we can use regular expressions.
def remove_numbers(text):
    return re.sub(r'\d+', '', text)
input_str = "There are 3 balls in this bag, and 12 in the other one."
print(remove_numbers(input_str))
Output:
There are balls in this bag and in the other one.
4. Converting Numerical Values
We can also convert the numbers into words. This can be done by using the inflect library.
p = inflect.engine()
def convert_number(text):
    temp_str = text.split()
    new_string = []
    for word in temp_str:
        if word.isdigit():
            new_string.append(p.number_to_words(word))
        else:
            new_string.append(word)
    return ' '.join(new_string)
input_str = "There are 3 balls in this bag, and 12 in the other one."
print(convert_number(input_str))
Output:
There are three balls in this bag and twelve in the other one.
5. Removing Punctuation
We remove punctuations so that we don't have different forms of the same word. For example if we don't remove the punctuation then been. been, been! will be treated separately.
def remove_punctuation(text):
    translator = str.maketrans('', '', string.punctuation)
    return text.translate(translator)
input_str = "Hey, did you know that the summer break is coming? Amazing right !! It's only 5 more days !!"
print(remove_punctuation(input_str))
Output:
Hey did you know that the summer break is coming Amazing right Its only 5 more days
6. Removing Whitespace
We can use the join and split functions to remove all the white spaces in a string.
def remove_whitespace(text):
    return " ".join(text.split())
input_str = "we    don't   need   the given      questions"
print(remove_whitespace(input_str))
Output:
we don't need the given questions
7. Removing Stopwords
Stopwords are words that do not contribute much to the meaning of a sentence hence they can be removed.
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('punkt_tab')
def remove_stopwords(text):
    stop_words = set(stopwords.words("english"))
    word_tokens = word_tokenize(text)
    filtered_text = [word for word in word_tokens if word.lower()
                     not in stop_words]
    return filtered_text
example_text = "This is a sample sentence and we are going to remove the stopwords from this."
print(remove_stopwords(example_text))
Output:
['sample', 'sentence', 'going', 'remove', 'stopwords', '.']
8. Applying Stemming
Stemming is the process of getting the root form of a word. Stem or root is the part to which affixes like -ed, -ize, -de, -s, etc are added. The stem of a word is created by removing the prefix or suffix of a word.
stemmer = PorterStemmer()
def stem_words(text):
    word_tokens = word_tokenize(text)
    stems = [stemmer.stem(word) for word in word_tokens]
    return stems
text = "data science uses scientific methods algorithms and many types of processes"
print(stem_words(text))
Output:
['data', 'scienc', 'use', 'scientif', 'method', 'algorithm', 'and', 'mani', 'type', 'of', 'process']
9. Applying Lemmatization
Lemmatization is an NLP technique that reduces a word to its root form. This can be helpful for tasks such as text analysis and search as it allows us to compare words that are related but have different forms
nltk.download('wordnet')
lemmatizer = WordNetLemmatizer()
def lemma_words(text):
    word_tokens = word_tokenize(text)
    lemmas = [lemmatizer.lemmatize(word) for word in word_tokens]
    return lemmas
input_str = "data science uses scientific methods algorithms and many types of processes"
print(lemma_words(input_str))
Output:
['data', 'science', 'us', 'scientific', 'method', 'algorithm', 'and', 'many', 'type', 'of', 'process']
10. POS Tagging
POS tagging is the process of assigning each word in a sentence its grammatical category, such as noun, verb, adjective or adverb.
import nltk
from nltk.tokenize import word_tokenize
from nltk import pos_tag
import os
import sys
nltk_data_dir = '/usr/local/share/nltk_data'
if nltk_data_dir not in nltk.data.path:
    nltk.data.path.append(nltk_data_dir)
nltk.download('averaged_perceptron_tagger_eng')
def pos_tagging(text):
    word_tokens = word_tokenize(text)
    return pos_tag(word_tokens)
input_str = "Data science combines statistics, programming, and machine learning."
print(pos_tagging(input_str))
Output:
[('Data', 'NNP'), ('science', 'NN'), ('combines', 'NNS'), ('statistics', 'NNS'), (',', ','), ('programming', 'NN'), (',', ','), ('and', 'CC'), ('machine', 'NN'), ('learning', 'NN'), ('.', '.')]
Where,
- NNP: Proper noun
- NN: Noun (singular)
- VBZ: Verb (3rd person singular)
- CC: Conjunction
51. What is the difference between Pretraining, Fine-tuning and Instruction Tuning?
Pretraining, Fine-tuning, and Instruction Tuning are three stages used to build and adapt large language models (LLMs).
Pretraining
- The model is trained on large-scale unlabeled text (books, websites, articles, code, etc.).
- Learns grammar, facts, reasoning patterns, and general language representations.
- Typically uses next-token prediction (Causal Language Modeling) for GPT-style models or Masked Language Modeling (MLM) for BERT-style models.
- Requires enormous datasets and computational resources.
- Produces a general-purpose foundation model.
- Goal: Learn broad language knowledge and representations.
Fine-tuning
- Starts with a pretrained model and trains it on a task-specific or domain-specific labeled dataset.
- Updates some or all of the model's parameters.
- Improves performance for a particular task such as sentiment analysis, summarization, medical QA, or legal document classification.
- Requires significantly less data and compute than pretraining.
- Goal: Adapt a pretrained model to a specific task or domain.
52. What is RLHF, and how do DPO and RLAIF differ from it?
RLHF (Reinforcement Learning from Human Feedback) aligns an instruction-tuned model's outputs with human preferences:
- Collect human preference data — annotators rank multiple model outputs for the same prompt.
- Train a reward model to predict which output humans would prefer.
- Use reinforcement learning (typically PPO — Proximal Policy Optimization) to fine-tune the LLM to maximize the reward model's score, while a KL-divergence penalty keeps it close to the original model to prevent reward hacking.
Challenges with RLHF: expensive/slow human annotation, reward model bias, and training instability from the RL loop itself.
Modern alternatives:
- DPO (Direct Preference Optimization): Skips the separate reward model and RL loop entirely it reframes preference alignment as a single supervised classification-style loss directly on preference pairs, making training simpler and more stable.
- RLAIF (RL from AI Feedback): Replaces human annotators with a stronger AI model that ranks outputs, reducing cost and improving scalability.
- GRPO (Group Relative Policy Optimization): A more recent variant that compares groups of sampled outputs against each other rather than needing an explicit reward model, giving PPO-like results at lower complexity.
Q53. What is PEFT, and how do LoRA and QLoRA work?
Parameter-Efficient Fine-Tuning (PEFT) adapts a large pretrained model to a new task by updating only a small number of parameters instead of the full model — critical for adapting billion-parameter LLMs affordably.
LoRA (Low-Rank Adaptation)
- Freezes the original weight matrix W and learns a low-rank decomposition of the update: ΔW = B·A, where B is (d × r) and A is (r × k), with rank r ≪ min(d, k).
- Only A and B are trained. This works because task-specific weight updates tend to have low "intrinsic rank" the useful signal lives in a small subspace.
- For a 4096×4096 attention matrix, a rank-16 LoRA trains ~131K parameters instead of ~16.7M.
QLoRA
- Combines LoRA with 4-bit quantization (NF4 — 4-bit NormalFloat) of the frozen base model, plus "double quantization" of the quantization constants themselves.
- This lets a 70B model be fine-tuned on far less GPU memory (e.g., ~35GB for weights instead of ~140GB in fp16), with LoRA adapters kept in higher precision (bf16) so gradients still flow cleanly.
Q54. What is quantization in the context of LLMs?
Quantization reduces the numerical precision used to store and compute a model's weights (and sometimes activations) — e.g., from 32-bit or 16-bit floating point down to 8-bit or 4-bit integers/floats to shrink memory footprint and speed up inference.
Common schemes:
- Post-Training Quantization (PTQ): Quantize an already-trained model's weights without further training; fast but can lose some accuracy.
- Quantization-Aware Training (QAT): Simulates quantization effects during training so the model adapts to lower precision, generally preserving more quality than PTQ.
- NF4 (4-bit NormalFloat): A quantization format designed for normally-distributed weights, used in QLoRA (see Q53).
Trade-off: Lower precision introduces quantization noise that can slightly degrade output quality, but for most practical inference/fine-tuning scenarios this loss is small relative to the memory and cost savings.
Q55. What is In-Context Learning (ICL)?
In-Context Learning is the ability of a large language model to perform a new task by conditioning on examples or instructions provided directly in the prompt, without any gradient updates to the model's weights. The model "learns" the pattern purely from the context window at inference time.
Types:
- Zero-shot: Only a task instruction is given, no examples. (See Q38 for the classic zero-shot definition — ICL is the mechanism that enables it in LLMs.)
- One-shot: A single labeled example is provided before the actual query.
- Few-shot: Several labeled examples are provided to establish the pattern.
Q56. Explain key prompt engineering techniques: Chain-of-Thought, Self-Consistency, ReAct and Step-Back prompting.
Prompt engineering techniques improve the reasoning and performance of Large Language Models (LLMs) by guiding how they process and respond to prompts.
Chain-of-Thought (CoT)
- Encourages the model to reason step by step before producing the final answer.
- Breaks complex problems into smaller logical steps.
- Improves reasoning on tasks involving mathematics, logic, and multi-step decision-making.
- Often uses prompts such as "Let's think step by step."
- Goal: Improve reasoning by making the model solve problems incrementally.
Self-Consistency
- An extension of Chain-of-Thought prompting.
- Generates multiple independent reasoning paths for the same question.
- Selects the most consistent or majority answer among the generated outputs.
- Reduces errors caused by a single incorrect reasoning path.
- Improves accuracy on complex reasoning tasks.
- Goal: Increase answer reliability through multiple reasoning attempts.
ReAct (Reason + Act)
- Combines reasoning with tool usage or actions.
- Commonly used in AI agents, RAG systems, and tool-using LLMs.
- Goal: Solve problems by combining reasoning with external information or actions.
Step-Back Prompting
- Encourages the model to first step back and identify the broader concepts or principles before solving the specific problem.
- Helps the model avoid focusing too narrowly on surface details.
- Particularly useful for complex reasoning and knowledge-intensive tasks.
- Improves generalization by reasoning from high-level concepts first.
- Goal: Improve reasoning by first considering the underlying principles.
Q57. What causes hallucination in LLMs, and how can it be mitigated?
Hallucination refers to an LLM generating fluent, confident-sounding text that is factually incorrect or not grounded in any real source.
Common causes:
- The model is trained to predict statistically likely next tokens, not to verify truth — fluency and factuality are optimized separately (or not at all).
- Gaps or ambiguity in training data, especially about long-tail or fast-changing facts.
- Compounding errors during long autoregressive generation, where an early mistake gets built upon.
- Overconfident phrasing patterns learned from training data that rewards decisive-sounding answers.
Mitigation strategies:
- Retrieval-Augmented Generation (RAG) — grounding responses in retrieved, verifiable documents (see Q40).
- Chain-of-Verification (CoVe) — the model generates a draft answer, then generates and answers verification questions about its own claims, and revises the answer accordingly.
- Lower temperature / more constrained decoding for factual tasks, reducing randomness in token selection.
- Structured output formats (e.g., requiring citations or JSON schemas) that make ungrounded claims easier to catch.
- RLHF/DPO alignment specifically penalizing confident-but-wrong answers during training (see Q52).
Q58. What are vector databases, and how are they used in NLP systems?
A vector database is a specialized data store optimized for indexing and querying high-dimensional embedding vectors (see Q8–Q11) using similarity search rather than exact match.
Role in NLP pipelines:
- Semantic search: Retrieve documents by meaning rather than keyword overlap.
- RAG systems: Store document chunk embeddings so a retriever can fetch relevant context for a generator (see Q40).
- Long-term memory for chatbots/agents: Storing past conversation embeddings so an agent can retrieve relevant history without keeping everything in the limited context window.
- Deduplication and clustering of large text corpora.
Q59. What are KV Caching and Speculative Decoding, and why do they matter for LLM inference?
Both are inference-time optimizations that address the fact that autoregressive generation (predicting one token at a time) is inherently slow.
KV Caching
- During generation, each new token's attention computation needs the Key and Value vectors of all previous tokens.
- Without caching, these would be recomputed from scratch at every step wastefully re-processing the entire prefix each time.
- KV caching stores (caches) the Key/Value tensors from previous steps and reuses them, so each new token only requires computing attention for the new token against the cached history.
- This turns per-token generation cost from growing quadratically into growing roughly linearly with sequence length, at the cost of extra GPU memory to hold the cache.
Speculative Decoding
- Uses a small, fast "draft" model to generate several candidate tokens ahead, which the larger target model then verifies in a single parallel forward pass accepting the draft tokens .
- Because verifying multiple tokens in parallel is cheaper than generating them one at a time, this can substantially speed up inference without changing the output distribution.
Together with quantization (Q54), these techniques are central to making LLM inference fast and affordable enough for production, real-time applications like chat.
Q60. What are Rotary Positional Embeddings (RoPE), and how do they differ from traditional positional encoding?
- Traditional Transformers add a separate positional encoding vector to each token's embedding before the first layer either fixed sinusoidal values or learned position embeddings.
- RoPE (Rotary Positional Embeddings) instead encodes position by rotating the query and key vectors in attention by an angle proportional to their position, using rotation matrices in a complex-number formulation.
Advantages over traditional positional encoding:
- Naturally captures relative position information, which is often more useful than absolute position for language.
- Generalizes better to sequence lengths longer than those seen during training (important for today's 100K–1M+ token context windows).
- No separate parameters or vectors need to be learned/stored — position is baked directly into the attention computation.
Q61. What is a Mixture of Experts (MoE) architecture?
A Mixture of Experts model replaces a Transformer's single dense feed-forward layer with multiple parallel "expert" sub-networks, plus a small gating/router network that decides, per token, which subset of experts (typically just 1–2 out of many) should process that token.
Trade-offs:
- Pros: Much higher parameter capacity at similar inference cost to a smaller dense model; different experts can specialize in different types of content.
- Cons: Higher memory requirements (all experts must be loaded even though only some run per token), more complex training (load balancing across experts, avoiding a few experts being over/under-used) and more complex serving infrastructure.
Q62. What are AI agents in NLP, and how does the ReAct pattern enable tool use?
An AI agent is an LLM-based system that doesn't just generate a single response, but can plan, take actions using external tools, observe results, and iterate toward completing a multi-step goal — rather than being limited to its own parametric knowledge and a single forward pass.
The ReAct (Reason + Act) pattern is the foundational loop behind most agent implementations:
- Reason: The model generates a thought about what it needs to do next.
- Act: The model calls a tool (web search, code execution, API call, database query).
- Observe: The tool's output is fed back into the model's context.
- Repeat until the model determines the task is complete, then produce a final answer.
Why this matters for NLP: It extends language models beyond static text generation into systems that can look up current information, perform calculations, interact with software, and correct course based on real feedback — addressing key limitations like hallucination (Q57) and stale training data.
Q63. What is Knowledge Distillation, and how is it used to compress NLP models?
Knowledge Distillation is a model compression technique where a smaller "student" model is trained to reproduce the behavior of a larger, more capable "teacher" model rather than being trained from scratch on raw labeled data alone.
How it works: Instead of only training the student on hard, one-hot ground-truth labels, it is also trained to match the teacher's full output probability distribution, which encodes richer information.
Applications in NLP:
- DistilBERT distilled from BERT, retains ~97% of performance with roughly 40% fewer parameters and ~60% faster inference.
- Compressing large LLMs into smaller, cheaper-to-serve models for latency-sensitive or on-device applications.
- Combining with quantization (Q54) and pruning for further compression.
Q64. How do you evaluate LLM outputs beyond traditional NLP metrics like BLEU/ROUGE?
Traditional metrics work well for tasks with a single "correct" reference output, but open-ended LLM generation (chat, reasoning, creative writing) often has many valid answers, making exact n-gram overlap metrics like BLEU/ROUGE poor proxies for quality.
Modern LLM evaluation approaches:
- LLM-as-a-Judge: Using a strong LLM to score or compare candidate responses against defined criteria (helpfulness, correctness, safety), often via pairwise comparison ("which response is better?") rather than absolute scoring. Faster and cheaper than human evaluation but can carry systematic biases (e.g., favoring longer or more confidently-worded answers, or position bias in pairwise comparisons).
- Human preference evaluation: The gold standard, but slow and expensive — often the basis for training data behind RLHF/DPO (Q52) as well as final model evaluation.
- Task-specific benchmarks: Standardized test suites (e.g., for reasoning, coding, factuality, safety) that give reproducible, comparable scores across models.
- Hallucination/factuality benchmarks: Specifically test whether a model's claims are verifiably grounded, often by checking generated statements against a trusted knowledge source.
- Red-teaming: Adversarial probing to find failure modes — unsafe outputs, jailbreaks, or biased responses — rather than measuring average-case quality.
