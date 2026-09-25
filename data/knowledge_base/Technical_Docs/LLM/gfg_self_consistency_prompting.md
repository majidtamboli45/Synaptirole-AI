# Self-Consistency Prompting

> Source: https://www.geeksforgeeks.org/artificial-intelligence/self-consistency-prompting/

Self-consistency prompting is a technique where an AI model generates multiple responses for the same query using different reasoning paths via sampling methods like temperature-based decoding. It then selects the final answer using aggregation techniques such as majority voting, choosing the most consistent output.
- Improves accuracy in multi-step reasoning tasks compared to single-response methods like Chain-of-Thought (CoT).
- Reduces the effect of randomness and errors by considering multiple reasoning paths instead of one.
- Works well in domains such as mathematics, logical reasoning and decision-making.
- Increases computational cost due to multiple response generation, creating a trade-off between efficiency and accuracy.
Most AI models use Chain-of-Thought (CoT) prompting to solve problems step by step, but it can still make mistakes due to relying on a single reasoning path. Self-consistency prompting improves this by generating multiple reasoning paths and selecting the most common answer, increasing accuracy and reliability, though at a higher computational cost.
Working of Self-Consistency Prompting
1. Multiple Responses
AI generates several answers to the same question based on different reasoning paths. Instead of relying on a single response, the model uses multiple approaches to tackle the problem, which allows it to explore different perspectives.
For example, if asked, "What is 8 + 5?", the model could reason in different ways: Each of these responses uses a slightly different way of thinking about the problem (direct calculation, step-by-step reasoning or an alternate way of phrasing the solution).
- Response 1: "8 + 5 is 13."
- Response 2: "Start from 8, count five numbers forward (9, 10, 11, 12, 13), so 8 + 5 equals 13."
- Response 3: "The sum of 8 and 5 is 13."
2. Aggregation
Once multiple responses are generated, they are compared to identify the most consistent answer among them. Goal is to identify which response appears most consistently across all generated answers.
- Uses techniques like majority voting, where the answer appearing most frequently is selected as the correct one.
- Helps ensure reliability by choosing the answer supported by multiple reasoning paths.
In the example above all generated responses give the answer 13, then 13 is selected as the final answer due to complete agreement.
3. Final Answer
The answer with the highest agreement is chosen as the final output. Even if there is no unanimous agreement, the most frequent answer is selected.
For Example: If two responses say 13 and one says 14, the final answer will still be 13 because it has the highest agreement. This makes the result more reliable, as it is supported by multiple independent reasoning paths.
Example of Self-Consistency Prompting
Let's take a more complex example where reasoning is required:
Example 1: : Basic Arithmetic Reasoning
Prompt 1: "If I have 3 apples and I give away 1 apple, how many apples do I have left?"
1. Without Self-Consistency (Single Response)
In a standard approach without self-consistency, the model generates only one answer based on a single reasoning path.
Model Answer: "I have 2 apples left."
This answer may be correct, but it depends on a single reasoning path and is not verified.
2. With Self-Consistency Prompting (Multiple Responses)
With self-consistency prompting, the model generates multiple answers using different reasoning paths to improve reliability.
- Response 1: "I start with 3 apples. If I give 1 apple away, I subtract 1 from 3, leaving me with 2 apples."
- Response 2: "I have 3 apples. After giving 1 apple away, I have 3 - 1 = 2 apples left."
- Response 3: "If I take away 1 apple from my 3, that leaves me with 2 apples."
Aggregation: All three responses agree that the correct answer is 2 apples. Since the responses are consistent, the final answer is selected as 2 apples. However, if the responses had differed, for example:
- Response 1: "I have 3 apples. I give away 1, so I have 1 apple left."
- Response 2: "3 apples minus 1 apple is 2 apples."
- Response 3: "3 apples minus 1 is 2 apples."
Here, there is one response saying 1 apple and two responses saying 2 apples. Model would select 2 apples as the final answer since it is the more consistent answer.
Example 2: Multi-step Numerical Calculation
Prompt 2: "What is 587 + 839?"
1. Without Self-Consistency (Single Response)
In this approach, the model generates only one answer, without validating it through alternative reasoning paths.
Model Answer: "1426"
This is a single response generated based on the model's reasoning. While the answer may be correct in this case, it could still be wrong if there’s an error in reasoning or an oversight, as there’s no cross-checking of multiple answers.
2. With Self-Consistency Prompting (Multiple Responses)
In this approach, the model generates multiple responses using different reasoning paths and selects the most consistent answer.
- Response 1: "587 + 839 = 1426"
- Response 2: "Adding 587 to 839 gives 1426"
- Response 3: "587 plus 839 equals 1426"
Aggregation: Since, all three responses agree that the answer is 1426, the model selects 1426 as the final, most consistent answer.
If the responses had differed, for example:
- Response 1: "587 + 839 = 1426"
- Response 2: "Adding 587 to 839 gives 1427"
- Response 3: "587 plus 839 equals 1426"
In this case, two responses say 1426 and one says 1427. Model would choose 1426 as the final answer since it is the more consistent answer across the majority of responses. This process helps the AI model to get things right by looking at the same problem from different angles.
Self-Consistency vs. Chain-of-Thought (CoT) Prompting
| Parameter | Self-Consistency | Chain-of-Thought (CoT) | 
|---|---|---|
| Method | Generates multiple answers based on different reasoning paths and selects the most consistent one. | Guides the AI to break down the reasoning process step-by-step to reach a conclusion. | 
| Accuracy | By cross-checking multiple responses, it improves accuracy, reducing errors in reasoning. | While accurate in many cases, a single reasoning path might still lead to errors or missed details. | 
| Error Handling | Less prone to errors as it aggregates different paths, making it more difficult for mistakes in individual reasoning. | CoT might miss critical steps if the reasoning chain is flawed, leading to incorrect answers. | 
| Flexibility | Offers flexibility by considering different angles, enhancing reliability in complex tasks. | CoT is structured and methodical but can be rigid, especially when dealing with ambiguous tasks. | 
| Application Scope | More useful for tasks requiring cross-validation, like commonsense reasoning, complex problem-solving and symbolic reasoning. | Ideal for tasks requiring clear, step-by-step logical reasoning but may struggle with complexity and ambiguity. | 
Applications
- Mathematical Problem Solving: Improves accuracy by comparing multiple solution paths and selecting the most consistent result in multi-step calculations.
- Commonsense Reasoning: Enhances everyday decision-making by choosing the most consistent and logical explanation among different interpretations.
- Logical Reasoning: Solves complex puzzles and reasoning tasks by evaluating and validating multiple solution approaches.
- Scientific Analysis: Supports better conclusions by comparing multiple hypotheses or interpretations before selecting the most consistent one.
- Natural Language Understanding (NLU): Reduces ambiguity in text by analyzing multiple interpretations and selecting the most reliable meaning.
- Question Answering Systems: Increases answer reliability by cross-checking multiple generated responses before finalizing the output.
Advantages
- Higher Accuracy: Improves correctness by evaluating multiple reasoning paths instead of relying on a single output.
- Reduced Bias: Considers diverse responses, leading to more balanced and less biased results.
- More Reliable Outputs: Uses consensus like majority voting to produce more trustworthy answers.
- Better for Complex Tasks: Handles multi-step reasoning and ambiguity more effectively by exploring different approaches.
- Robustness to Errors: Minimizes the impact of incorrect intermediate reasoning by cross-checking multiple responses.
Limitation
- Higher Computational Cost: Requires generating multiple responses, increasing time and resource usage.
- Slower Response Time: Not ideal for real-time or latency-sensitive applications.
- Aggregation Complexity: Selecting the best answer (e.g., voting, ranking) can be challenging in complex cases.
- Limited Creativity: Focus on consistency may reduce diversity in open-ended or creative tasks.
- Conflict Handling Issues: Difficult to resolve when responses are highly contradictory or evenly split.
