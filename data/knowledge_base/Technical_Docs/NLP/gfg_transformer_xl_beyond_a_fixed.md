# Transformer XL Beyond a Fixed

> Source: https://www.geeksforgeeks.org/nlp/trasformer-xl-beyond-a-fixed-length-context/

Transformer-XL (Transformer-Extra Long) is an advanced language model that extends the Transformer Architecture to process long text sequences more effectively. Unlike the standard Transformer, which processes text within a fixed-length context, Transformer-XL reuses information from previously processed text segments.
Example
Consider the following text divided into two segments:
Segment 1:
"Alice visited the library yesterday.
She borrowed a book."
Segment 2:
"Later, she started reading it."
In this example, the words "she" and "it" in Segment 2 refer to Alice and the book mentioned in Segment 1. To understand these references correctly, the model must remember information from the previous segment.
Working
- The input text is divided into smaller fixed-length segments for processing.
- The model processes the first segment and generates contextual representations for each token. These representations capture the meaning of words within the segment.
- Instead of discarding the contextual representations after processing the first segment, Transformer-XL stores them as memory.
- While processing the second segment, the model reuses the stored memory from the previous segment. This helps it recognize that "she" refers to Alice and "it" refers to the book.
- By combining information from the current segment and the stored memory, Transformer-XL produces contextual representations that preserve long-range dependencies and improve the understanding of long text sequences.
Limitations of Former Transformer
Although the Transformer performs well on many NLP tasks, it has several limitations when processing long text sequences.
- The model processes only a fixed number of tokens at a time, limiting its ability to understand long documents.
- It cannot effectively capture relationships between words that are far apart across different text segments.
- Long text is divided into separate segments, causing the model to lose contextual continuity between consecutive segments.
- Previously processed segments are computed again for each new segment, increasing computational cost and evaluation time.
Architecture
Transformer-XL extends the vanilla Transformer by introducing two key architectural components that enable it to process long text sequences more effectively. These components are the Segment-Level Recurrent Mechanism, and Relative Positional Encoding.
1. Segment-level recurrent mechanism
The Segment-Level Recurrent Mechanism is one of the key architectural innovations introduced in Transformer-XL.
- It enables the model to preserve contextual information across consecutive text segments by reusing the hidden states generated from previously processed segments.
- Instead of discarding the hidden states after processing a segment, Transformer-XL stores them as memory and uses them while processing the next segment.
- This allows the model to capture long-range dependencies and reduces context fragmentation.
Mathematical Formulation
Consider two consecutive text segments:
- S_{\tau} : Previous segment
- S_{\tau+1} : Current segment
Let:
- L be the length of each sequence.
- D be the hidden dimension of the model.
- n be the Transformer layer number.
Let the hidden states be:
- h_{\tau}^{n-1} \in \mathbb{R}^{L \times D} : Hidden state of the previous segment at layer n−1.
- h_{\tau+1}^{n-1} \in \mathbb{R}^{L \times D} : Hidden state of the current segment at layer n−1.
Before processing the current segment, Transformer-XL combines the hidden states of the previous and current segments. This is represented as:
h^{\sim n-1}_{\tau+1} = [SGh^{n-1}_{\tau} \oplus SGh^{n-1}_{\tau +1} ] 
where:
- SG represents the Stop Gradient operation.
- ⊕ denotes concatenation of the hidden states.
The combined hidden state is then used to compute the Key and Value matrices, while the Query matrix is generated only from the current segment.
The Query matrix is computed as:
q^n_{\tau+1} = h^{n-1}_{\tau+1}W_q 
The Key matrix is computed as:
k^n_{\tau+1} = h^{\sim n-1}_{\tau+1}W_k^T 
The Value matrix is computed as:
v^n_{\tau+1} = h^{\sim n-1}_{\tau+1}W_v^T 
where:
Wq, Wk, and Wv are the learnable weight matrices used to generate the Query, Key, and Value representations.
Segment-Level Recurrent Mechanism During Training
- The input text is divided into fixed-length segments.
- Each segment is processed independently during the forward pass.
- Hidden states generated from the previous segment are stored as memory.
- The stored memory is reused while processing the current segment.
- The Stop Gradient (SG) operation prevents gradients from propagating back to previous segments.
- This mechanism enables the model to preserve contextual information while keeping training computationally efficient.
Segment-Level Recurrent Mechanism During Evaluation
- During inference, hidden states from previous segments are continuously reused as memory.
- The current segment attends to both its own hidden states and the stored memory.
- Previously processed segments do not need to be recomputed.
- This extends the effective context available to the model.
- As a result, Transformer-XL can process much longer sequences while maintaining contextual continuity.
2. Relative Positional Encoding
Relative Positional Encoding is the second key architectural innovation introduced in Transformer-XL.
- Unlike the vanilla Transformer, which assigns an absolute position to each token, Transformer-XL represents token positions based on their relative distance from one another.
- This enables the model to capture positional relationships more effectively, especially when processing long text sequences.
Mathematical Formulation
In the vanilla Transformer, the embedding vector () of each token is combined with its absolute positional encoding (U). The resulting representation is then projected using the Query and Key weight matrices to compute the attention score.
The attention score between the token at position i and the token at position j is given by:
A_{ij} = E_{x_i} ^ T W_q^TW_kE_{x_j} + E_{x_i} ^ T W_q^TW_kU_{j} + U_{i} ^ T W_q^TW_kE_{x_j} +U_{i} ^ T W_q^TW_kU_{j} 
where:
- A_{ij} is the attention score between the tokens at positions iii and j.
- E_{x_i} andE_{x_j} are the embedding vectors of the tokens.
- U_i andU_j are the absolute positional encoding vectors.
- W_q andW_k are the Query and Key weight matrices.
To address this limitation, Transformer-XL replaces absolute positional encoding with relative positional encoding. The attention score is modified as follows:
A_{ij} = E_{x_i} ^ T W_q^TW_kE_{x_j} + E_{x_i} ^ T W_q^TW_kR_{i-j} + u^T W_{k,E}E_{x_j} +v^T W_{K,R}U_{j} 
where:
- R_{i-j} is the relative positional embedding, representing the distance between tokens i and j.
- u is the global content bias learned during training.
- v is the global positional bias learned during training.
- W_{k,E} i s the weight matrix used for content-based key vectors.
- W_{k,R} is the weight matrix used for position-based key vectors.
The attention score in Transformer-XL consists of four components, each contributing differently to the final attention calculation.
- Content-Based Addressing: This term measures the semantic similarity between two tokens based solely on their content. It helps the model determine how strongly one token should attend to another according to their meanings.
- Content-Dependent Positional Bias: This term combines the content of the current token with the relative distance between two tokens. It enables the model to consider both semantic information and positional relationships during attention.
- Global Content Bias: This term introduces a learnable global bias based on token content. It allows the model to capture general content patterns that are useful across different sequences.
- Global Positional Bias: This term introduces a learnable positional bias based on the relative distance between tokens. It helps the model learn general positional patterns independent of the token content.
Applications
- Predicts the next token in long text sequences by preserving context across multiple segments.
- Generates coherent long-form text by retaining contextual information from previously processed segments.
- Improves translation quality by maintaining context across long sentences and paragraphs.
- Produces more accurate summaries by capturing information from the entire document.
- Retrieves answers from long passages by utilizing context preserved across multiple segments.
Advantages
- Processes long text sequences without losing contextual information.
- Captures long-range dependencies more effectively than the vanilla Transformer.
- Reuses hidden states from previous segments, reducing repeated computation.
- Uses relative positional encoding for improved positional understanding.
- Reduces context fragmentation between consecutive text segments.
- Achieves faster evaluation by reusing previously computed memory.
Limitations
- Has a more complex architecture than the vanilla Transformer.
- Requires additional memory to store hidden states from previous segments.
- Training is computationally more expensive due to the recurrence mechanism.
- Contains more parameters, increasing the model size.
- Implementation and optimization are more challenging than standard Transformer models.
