# What is Dense Passage Retrieval (DPR)?

> Source: https://www.geeksforgeeks.org/nlp/what-is-dense-passage-retrieval-dpr/

Dense Passage Retrieval is a neural retrieval method designed to retrieve relevant passages from a large corpus in response to a query. Unlike traditional sparse retrieval techniques, DPR represents both queries and passages as dense vectors in a continuous embedding space. These embeddings are learned using deep neural networks, enabling the system to capture rich semantic relationships between words, phrases, and entire passages.
DPR is to represent both questions and document passages as dense vectors in a shared embedding space. By doing so, it allows for efficient computation of semantic similarity between a query and potential answer passages, enabling the system to identify the most relevant documents even when they do not contain exact keyword matches.
How does Dense Passage Retrieval work?
The architecture of DPR consists of two primary components: the query encoder and the passage encoder. These encoders are typically implemented using transformer-based models like BERT (Bidirectional Encoder Representations from Transformers).
Here's a step-by-step breakdown of how DPR operates:
1. Encoding Queries and Passages
- The query encoder takes a user's question or query as input and generates a dense vector representation (embedding) of the query.
- Similarly, the passage encoder processes each document passage in the corpus and produces a corresponding dense vector representation.
2. Computing Similarity Scores
- Once both the query and passages are encoded into dense vectors, DPR computes the similarity between them using a metric such as cosine similarity or dot product.
- The similarity score quantifies how closely related the query is to each passage in the corpus.
3. Retrieving Relevant Passages
- Based on the computed similarity scores, DPR ranks the passages and retrieves the top-k most relevant ones.
- These retrieved passages can then be used as input for downstream tasks, such as question answering or summarization.
4. Training the Model
- DPR is trained using a contrastive learning approach, where the model learns to maximize the similarity between a query and its correct (positive) passage while minimizing the similarity with incorrect (negative) passages.
- This training process ensures that the embeddings capture meaningful semantic relationships between queries and passages.
Advantages of DPR Over Traditional Methods
Traditional information retrieval systems rely heavily on term frequency-inverse document frequency (TF-IDF) or BM25 algorithms, which match queries to documents based on keyword overlap. While effective for simple queries, these methods struggle with complex, multi-word expressions or queries that require understanding context.
DPR offers several key advantages over traditional approaches:
- Semantic Understanding : By using dense vector representations, DPR captures the meaning of words and phrases, allowing it to handle queries with synonyms, paraphrases, and implicit contexts.
- Improved Relevance : Unlike keyword-based methods, DPR focuses on semantic similarity, leading to higher-quality results that better align with user intent.
- Scalability : With advancements in approximate nearest neighbor (ANN) search techniques, DPR can efficiently scale to large datasets without sacrificing performance.
- End-to-End Learning : DPR integrates seamlessly with other NLP models, enabling end-to-end optimization for tasks like question answering and conversational agents.
Implementation of DPR
Let's understand how Dense Passage Retrieval (DPR) works in practice.
Step 1: Import Required Libraries
We start by importing the necessary libraries and modules. These include pre-trained models and tokenizers from the transformers library, PyTorch for tensor operations, and FAISS for efficient similarity search.
from transformers import DPRQuestionEncoder, DPRContextEncoder, DPRQuestionEncoderTokenizer, DPRContextEncoderTokenizer
import torch
import faiss
Step 2: Load Pre-Trained Encoders and Tokenizers
Here, we load the pre-trained DPR encoders and tokenizers. The question encoder transforms queries into dense vectors, while the context encoder does the same for passages. The tokenizers convert text into input formats suitable for the encoders.
# Load pre-trained encoders and tokenizers
question_encoder = DPRQuestionEncoder.from_pretrained("facebook/dpr-question_encoder-single-nq-base")
context_encoder = DPRContextEncoder.from_pretrained("facebook/dpr-ctx_encoder-single-nq-base")
question_tokenizer = DPRQuestionEncoderTokenizer.from_pretrained("facebook/dpr-question_encoder-single-nq-base")
context_tokenizer = DPRContextEncoderTokenizer.from_pretrained("facebook/dpr-ctx_encoder-single-nq-base")
Step 3: Encode a Sample Query
In this step, we encode a sample query into a dense vector representation using the question encoder. The tokenizer converts the query into a format that the model can process, and the encoder generates the embedding.
# Encode a sample query
query = "What is Dense Passage Retrieval?"
# Tokenize the query
inputs = question_tokenizer(query, return_tensors="pt")  
query_embedding = question_encoder(**inputs).pooler_output.detach().numpy()  
Step 4: Encode Sample Passages
Next, we encode a set of sample passages into dense vector representations using the context encoder. Each passage is tokenized, passed through the encoder, and converted into an embedding.
# Encode sample passages
passages = [
    "Dense Passage Retrieval (DPR) is a neural retrieval method.",
    "BM25 is a traditional keyword-based retrieval method."
]
passage_embeddings = []
for passage in passages:
    inputs = context_tokenizer(passage, return_tensors="pt") 
    embedding = context_encoder(**inputs).pooler_output.detach().numpy() 
    passage_embeddings.append(embedding)
Step 5: Create a FAISS Index
FAISS is used to efficiently perform similarity searches. Here, we create an index using the L2 distance metric (Euclidean distance) and add the passage embeddings to it. This allows us to quickly find the most relevant passage for a given query.
# Convert to FAISS index
passage_embeddings = torch.tensor(passage_embeddings).squeeze().numpy()  
index = faiss.IndexFlatL2(passage_embeddings.shape[1])  
index.add(passage_embeddings)  
Step 6: Search for the Closest Passage
Finally, we use the FAISS index to find the closest passage to the query. The search function returns the distances (D) and indices (I) of the top-k most similar passages. We then print the most relevant passage.
# Search for the closest passage
D, I = index.search(query_embedding, k=1) 
print(f"Most relevant passage: {passages[I[0][0]]}")  
Complete Code:
from transformers import DPRQuestionEncoder, DPRContextEncoder, DPRQuestionEncoderTokenizer, DPRContextEncoderTokenizer
import torch
import faiss
# Load pre-trained encoders and tokenizers
question_encoder = DPRQuestionEncoder.from_pretrained("facebook/dpr-question_encoder-single-nq-base")
context_encoder = DPRContextEncoder.from_pretrained("facebook/dpr-ctx_encoder-single-nq-base")
question_tokenizer = DPRQuestionEncoderTokenizer.from_pretrained("facebook/dpr-question_encoder-single-nq-base")
context_tokenizer = DPRContextEncoderTokenizer.from_pretrained("facebook/dpr-ctx_encoder-single-nq-base")
# Encode a sample query
query = "What is Dense Passage Retrieval?"
inputs = question_tokenizer(query, return_tensors="pt")
query_embedding = question_encoder(**inputs).pooler_output.detach().numpy()
# Encode sample passages
passages = ["Dense Passage Retrieval (DPR) is a neural retrieval method.", "BM25 is a traditional keyword-based retrieval method."]
passage_embeddings = []
for passage in passages:
    inputs = context_tokenizer(passage, return_tensors="pt")
    embedding = context_encoder(**inputs).pooler_output.detach().numpy()
    passage_embeddings.append(embedding)
# Convert to FAISS index
passage_embeddings = torch.tensor(passage_embeddings).squeeze().numpy()
index = faiss.IndexFlatL2(passage_embeddings.shape[1])
index.add(passage_embeddings)
# Search for the closest passage
D, I = index.search(query_embedding, k=1)
print(f"Most relevant passage: {passages[I[0][0]]}")
Output:
Most relevant passage: Dense Passage Retrieval (DPR) is a neural retrieval method.
Challenges and Solutions of DPR
While DPR offers significant advantages over traditional keyword-based retrieval, it also comes with challenges:
- High Computational Costs: Training DPR requires powerful GPUs and large-scale datasets, making it resource-intensive.
Solution: Efficient training techniques like knowledge distillation and model pruning can help reduce computational overhead.
- Need for High-Quality Training Data: The performance of DPR depends on well-labeled datasets with relevant query-passage pairs.
Solution: Techniques like weak supervision and semi-supervised learning can help generate high-quality training data.
- Scalability in Large Datasets: Despite using Approximate Nearest Neighbor (ANN) search, DPR still faces challenges in real-time retrieval for massive datasets.
Solution: Hybrid models combining DPR with traditional retrieval methods (e.g., BM25 + DPR) can balance efficiency and accuracy.
Real-World Applications of DPR:
DPR is widely used in fields that demand fast and precise information retrieval:
- Open-Domain Question Answering: DPR enhances AI systems like Google Search and research assistants by retrieving the most relevant documents for user queries.
- Enterprise Knowledge Search: Businesses use DPR to improve search capabilities across corporate databases, wikis, and internal documentation.
- Biomedical and Scientific Research: Researchers rely on DPR for quick access to scientific papers and clinical studies, improving literature reviews in healthcare and pharmaceuticals.
- Legal and Financial Document Retrieval: Law firms and financial analysts use DPR-powered search engines to efficiently find case law, contracts, and financial reports.
- AI Chatbots and Virtual Assistants: DPR enables AI chatbots to provide more precise answers by retrieving information from large knowledge bases, enhancing customer support and automation.
Dense Passage Retrieval (DPR) has transformed how we retrieve information by leveraging deep learning for semantic search, surpassing traditional keyword-based methods. Despite challenges like computational costs and data requirements, DPR’s accuracy, scalability, and efficiency make it a leading choice for modern retrieval systems.
