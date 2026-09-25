# What is a Vector Database?

> Source: https://www.geeksforgeeks.org/data-science/what-is-a-vector-database/

A vector database is a specialized type of database designed to store, index and search high dimensional vector representations of data known as embeddings. Unlike traditional databases that rely on exact matches vector databases use similarity search techniques such as cosine similarity or Euclidean distance to find items that are semantically or visually similar.
What are Embeddings?
- Embeddings are dense numerical representations of data such as words, sentences, images or audio mapped into a continuous high dimensional space where similar items are positioned closer together.
- Machine learning models that capture semantic meaning, context and relationships within the data generates them.
- Instead of comparing raw text or media directly embeddings allow systems to measure similarity through mathematical distance metrics like cosine similarity or Euclidean distance for faster search and extraction.
- This makes them important for tasks such as semantic search, recommendation systems, clustering, classification and cross lingual matching.
How do they Work?
- Embeddings work by converting raw data like text, images or audio into dense numerical vectors that preserve meaning and relationships.
- First the input is processed through a model such as a transformer for text or a CNN for images to extract key features.
- These features are then encoded into fixed length vectors in a high dimensional space where similar items are positioned close together and dissimilar ones are farther apart.
- This spatial arrangement allows similarity to be measured mathematically enabling applications like search, recommendations and classification to operate based on meaning rather than exact matches.
Popular Vector Databases
- Pinecone: Fully managed, cloud native vector database with high scalability and low latency search.
- Weaviate: Open source, supports hybrid (keyword + vector) search and offers built in machine learning modules.
- Milvus: Highly scalable, open source database optimized for large scale similarity search.
- Qdrant: Open source, focuses on high recall, performance and ease of integration with AI applications.
- Chromadb: Lightweight, developer friendly vector database often used in LLM powered applications.
Implementation
This code uses FAISS to store 3 sample vectors and perform a similarity search using L2 distance. The query_vector is compared to all stored vectors and the indices and distances of the top 2 most similar vectors are returned.
import faiss
import numpy as np
data_vectors = np.array([
    [0.1, 0.2, 0.3, 0.4],
    [0.2, 0.1, 0.4, 0.3],
    [0.9, 0.8, 0.7, 0.6],
], dtype='float32')
dimension = data_vectors.shape[1]
index = faiss.IndexFlatL2(dimension)
index.add(data_vectors)
query_vector = np.array([[0.1, 0.2, 0.3, 0.35]], dtype='float32')
distances, indices = index.search(query_vector, k=2)
print("Indices of closest vectors:", indices)
print("Distances from query:", distances)
Output:
Indices of closest vectors: [[0 1]]
Distances from query: [[0.0025 0.0325]]
Applications
- Image and Video Search: Finds visually similar media from a database. Feature embeddings are extracted from media files and stored in the vector database. When a new image or frame is queried, the system quickly retrieves the most visually similar results.
- Question Answering Systems: Retrieves the most relevant information from large knowledge bases. The system embeds both queries and stored text then compares their vectors to find the closest match. This improves accuracy compared to simple keyword matching.
- Cross Lingual Information Retrieval: Supports matching across multiple languages using multilingual embeddings. Text in different languages is converted into a shared embedding space. This allows searching in one language and retrieving relevant results in another.
- Fraud and Anomaly Detection: Identifies unusual patterns by comparing embeddings with normal data. The database can store embeddings of typical behavior and detect deviations. This helps in early identification of fraudulent or suspicious activities.
