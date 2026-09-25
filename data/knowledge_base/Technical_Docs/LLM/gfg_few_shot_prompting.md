# Few Shot Prompting

> Source: https://www.geeksforgeeks.org/artificial-intelligence/few-shot-prompting/

Few‑shot prompting is a technique in AI where a model is given a small number of examples within the prompt to guide its response. By learning from these examples, the model can better understand the task and generate more accurate and relevant outputs without additional training.
- Allows models to learn task patterns from a few input-output examples without retraining
- Uses in-context learning, where examples are included directly in the prompt
- Applied in tasks such as classification, translation, summarization and code generation
Working
Few-shot prompting is a technique where a large language model (LLM) is guided by providing a small number of examples directly within the prompt. These examples demonstrate the desired task, enabling the model to generalize and produce accurate outputs without explicit training.
1. User Query Initialization
The process starts when the model receives a user query, which serves as the input for the task. This query establishes the context and defines what the model needs to do such as classification, translation or sentiment analysis.
2. Example Source (Static or Dynamic)
Few-shot prompting uses examples to guide the model, which can either be predefined or dynamically retrieved based on the query.
- Static Examples: These are manually written examples included directly in the prompt to demonstrate the task clearly.
- Dynamic Examples: These are fetched from a vector store using semantic similarity, ensuring the examples closely match the user query context.
A vector store enables meaning-based retrieval rather than exact keyword matching, allowing the system to select the most relevant examples and improve overall model performance.
3. Retrieval of Relevant Examples
If dynamic retrieval is used, the system performs semantic matching to find the most relevant examples:
- The query is converted into embeddings
- Similar examples are searched in the vector store
- Top-k most relevant examples are selected
In advanced systems, Retrieval-Augmented Generation (RAG) may be used to improve retrieval quality by ensuring that the selected examples are highly relevant to the query context.
4. Prompt Construction
Here the system builds a well-structured prompt by combining examples and the user query to guide the model toward the desired output.
- Retrieved Examples: Input-output pairs that demonstrate how the task should be performed.
- Instructions: Optional guidelines that clarify the task and expected response format.
- User Query: The new input on which the model needs to generate a response.
For Example: Classify the sentiment of the following sentences:
Sentence: "I love this product"
Sentiment: Positive
Sentence: "This is the worst experience"
Sentiment: Negative
Sentence: "This app is really easy to use"
Sentiment: Positive
This structured prompt helps the model recognize patterns from the examples and apply them to the user query. A clear and well-formatted prompt significantly improves the accuracy and consistency of the generated output.
5. Model Processing
LLM processes the constructed prompt by using its internal knowledge and the provided examples.
- Pre-trained Knowledge: The model uses patterns and information learned during its training phase.
- In-Context Learning: It learns from the examples given in the prompt without updating its parameters.
- Pattern Application: The model identifies relationships in examples and applies them to the user query.
Model combines prior knowledge with in-context examples to understand the task and generate an appropriate response. This enables effective performance without requiring additional training.
6. Output Generation
Here the model produces the response by applying the patterns learned from the examples to the user query. The output is generated in the expected format, completing the task such as classification, translation or text generation.
Examples of Few-Shot Prompting
Here are a few prompt examples to demonstrate how Few Shot Prompting works:
Example 1: Text Generation
- Task: Generate a poem based on given examples
- Prompt: “Here are some examples of poems about nature. Based on these, write a new poem about the beauty of a sunset.”
Examples Provided:
1. The sky is painted bright, the sun begins to fall, Golden hues stretch far, lighting up the world for all.
2. As the sun sets low, the stars begin to glow, The evening breeze whispers soft and slow.
AI Output:
As the sun fades away, the sky turns to gold,
The colors blend, a story untold.
A calm breeze flows, the air turns cool,
The world sighs gently, under the moon’s rule.
The model learns the style, tone and structure of the poems from the examples and generates a new poem following similar patterns. This shows how few-shot prompting enables creative tasks without explicit training.
Example 2: Classification Task
- Task: Classify a product based on given categories
- Prompt: “Here are a few examples of product categories and their descriptions. Based on these, categorize the following product description.”
Examples Provided:
1. Smartphone: A device used for communication, browsing the internet and running apps.
2. Laptop: A portable personal computer with a keyboard and screen, used for work, browsing and entertainment.
- Query: "This device is lightweight, portable and has a touch screen for easy navigation and app usage."
- AI Output: Smartphone
The model compares the query with the provided examples and identifies the closest match based on semantic similarity and key features. This shows how few-shot prompting works effectively for classification tasks.
Strategies
- Use clear, relevant examples aligned with the task.
- Include diverse examples to improve generalization.
- Keep input-output format consistent.
- Use few high-quality examples to avoid noise.
- Tailor examples to the specific task/domain.
- Test and refine prompts regularly.
- Avoid overfitting by testing on new inputs.
Applications
- Content creation: Generates text by mimicking example styles.
- Video action recognition: Classifies actions with minimal data.
- Question answering: Improves accuracy using sample Q&A pairs.
- Translation: Converts text using few example pairs.
- Chatbots: Learns from sample conversations for better responses.
- Sentiment analysis: Classifies text with limited labeled data.
- NER: Identifies entities using few annotated examples.
- Code tasks: Assists in code generation and debugging.
Advantages
- Requires minimal training data.
- Enables faster task learning.
- Adapts to multiple tasks easily.
- Reduces data and processing costs.
- Useful where large datasets are unavailable.
Limitations
- May give inaccurate results in some cases.
- Can introduce bias from limited examples.
- Risk of overfitting to given samples.
- Less effective for complex tasks.
