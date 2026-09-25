# Chunking Strategies

> Source: https://www.geeksforgeeks.org/artificial-intelligence/chunking-strategies/

Chunking is the process of segmenting text into smaller, manageable portions based on length, structure or semantic meaning. It allows vector search to focus on precise information rather than entire documents. Understanding different chunking methods helps improve retrieval accuracy and model performance in Retrieval Augmented Generation pipelines.
Need for Chunking
- LLM Token Limitations: Long documents may exceed token limits, making direct processing inefficient or requiring techniques like truncation or sliding windows
- Improved Retrieval Accuracy: Smaller segments allow retrieval pipelines to match context more precisely.
- Better Performance: Chunking reduces computation overhead and speeds up embedding searches.
- Context Preservation: Keeps relevant text together, reducing hallucinations and incorrect reasoning.
- Efficient Knowledge Access: Enables document querying without loading entire files into memory.
Chunking Strategies
1. Fixed-Size Chunking: Splits text into equal-sized segments based on characters or tokens.
- Simple and easy to implement
- Works well for plain text
- May break sentences or context
2. Recursive Character Splitter: Splits text using multiple fallback rules to preserve structure.
- Maintains sentence flow
- Avoids abrupt splits
- Produces more readable chunks
3. Token-Based Chunking: Splits text based on model token limits.
- Prevents token overflow in LLMs
- Aligns with model constraints
- Reduces truncation issues
4. Sentence or Semantic Chunking: Groups text based on meaning or sentence boundaries.
- Preserves semantic context
- Ideal for descriptive content
- Improves retrieval quality
5. Document-Based Chunking: Breaks structured documents into logical sections.
- Works well for PDFs and web pages
- Maintains document hierarchy
- Useful for large datasets
Chunk Overlap
Chunk overlap refers to the technique of including a small portion of text from the end of one chunk at the beginning of the next chunk. This helps maintain continuity between chunks and prevents important information from being lost when text is split. It is especially useful when sentences or ideas span across multiple chunks.
- Maintains Context Flow: Overlapping small portions of text ensures that important information crossing chunk boundaries is preserved.
- Reduces Context Loss: When a sentence spans two chunks, overlaps prevent missing meaning during retrieval.
- Improves Answer Accuracy: Retrieval models gain continuity, leading to clearer and more complete responses.
- Better Semantic Understanding: Overlaps enhance embeddings by preserving transitional phrases and linked ideas.
Selecting Chunk Sizes
Choosing the right chunk size depends on the type of document and the use case. If chunks are too large, the model may include unnecessary data. If chunk is too small, it may lose essential meaning. Some recommended chunk sizes in LangChain are:
- 300–500 Tokens: Useful for most general documents where moderate context is needed.
- 600–900 Tokens: Ideal for technical guides and manuals requiring deeper reference context.
- 100–200 Tokens: Effective for short chats, logs or small knowledge fragments.
Implementation of Chunking Strategies
Step 1: Install Required Libraries
Installing LangChain for chunking utilities.
!pip install langchain
Step 2: Load the Document
Reading the input text file.
text = open("sample_doc.txt", "r").read()
You can download document from here.
1. Fixed-Size Chunking
from langchain.text_splitter import CharacterTextSplitter
splitter = CharacterTextSplitter(chunk_size=300, chunk_overlap=50)
chunks = splitter.split_text(text)
print("Fixed Size Chunks:", len(chunks))
print(chunks[0])
Output:
Machine learning is a branch of artificial intelligence focused on building systems that learn from data. These systems improve their performance over time without being explicitly programmed. There are many applications of machine learning, such as image classification, speech recognition, recommendation systems, and autonomous driving.
2. Recursive Character Chunking
from langchain.text_splitter import RecursiveCharacterTextSplitter
splitter = RecursiveCharacterTextSplitter(chunk_size=400, chunk_overlap=80)
chunks = splitter.split_text(text)
print("Recursive Chunks:", len(chunks))
print(chunks[0])
Output:
Machine learning is a branch of artificial intelligence focused on building systems that learn from data. These systems improve their performance over time without being explicitly programmed. There are many applications of machine learning, such as image classification, speech recognition, recommendation systems, and autonomous driving.
3. Token-Based Chunking
from langchain.text_splitter import TokenTextSplitter
splitter = TokenTextSplitter(chunk_size=256, chunk_overlap=32)
chunks = splitter.split_text(text)
print("Token-Based Chunks:", len(chunks))
print(chunks[0])
Output:
Token-Based Chunks: 1
Machine learning is a branch of artificial intelligence focused on building systems that learn from data. These systems improve their performance over time without being explicitly programmed. There are many applications of machine learning, such as image classification, speech recognition, recommendation systems, and autonomous driving.
Supervised learning uses labeled data to train predictive models. It is commonly used for tasks like spam detection and sentiment analysis. Unsupervised learning, on the other hand, discovers hidden patterns in unlabeled data, such as customer clustering or anomaly detection.
Reinforcement learning involves agents making decisions by interacting with an environment. They receive rewards or penalties based on their actions and learn optimal behaviors through continuous feedback. This approach is widely used in robotics, game playing, and resource optimization.
Although machine learning is powerful, it also comes with challenges such as data bias, overfitting, model interpretability, and computational complexity. It is important to choose the right algorithms, preprocess data correctly, and validate models properly to ensure reliable results.
4. Sentence / Semantic Chunking
from langchain_experimental.text_splitter import SemanticChunker
from langchain.embeddings import OpenAIEmbeddings
embeddings = OpenAIEmbeddings()
splitter = SemanticChunker(embeddings)
chunks = splitter.split_text(text)
print("Semantic Chunks:", len(chunks))
Output:
Total Chunks Created: 4
Machine learning is a branch of artificial intelligence focused on building systems that learn from data. These systems improve their performance over time without being explicitly programmed. There are many applications of machine learning, such as image classification, speech recognition, recommendation systems, and autonomous driving.
Note: Semantic chunking depends on embedding models and may require external APIs, so it is not included as a runnable example here.
5. Document-Based Chunking
from langchain.document_loaders import TextLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
loader = TextLoader("sample_doc.txt")
documents = loader.load()
splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=100)
chunks = splitter.split_documents(documents)
print("Document Chunks:", len(chunks))
Output:
Document Chunks: 4
You can download the complete code from here.
Applications
- Question Answering: Chunking ensures that only the most relevant text segments are passed to the model, resulting in accurate and context-aware answers.
- Document Summarization: Long reports and research papers can be divided into sections, allowing LLMs to condense information more effectively.
- Semantic Search: By chunking text into context-rich pieces, search engines retrieve more precise and meaningful results rather than broad document matches.
- Chatbots: Segmented knowledge bases provide chatbots with localized context, improving reply quality and reducing hallucinations.
- Knowledge Graphs: Chunked text can be transformed into nodes and edges, enabling reasoning across distributed concepts and relationships.
