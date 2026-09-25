# ReAct (Reasoning + Acting) Prompting

> Source: https://www.geeksforgeeks.org/artificial-intelligence/react-reasoning-acting-prompting/

ReAct (Reasoning + Acting) is a prompting technique where an AI combines step-by-step reasoning with actions, allowing it to think through a problem and take steps to solve it.
- Breaks complex problems into steps and decides actions at each stage
- Uses results from actions (observations) to refine and improve future decisions
- Used in chatbots, robotics, and automation
Working
1. Combining Reasoning and Action
- In traditional AI models, reasoning and action are separate. ReAct helps in combining them so that AI thinks about a problem and takes action in real time. It can adjust its actions based on new information just like a human would while solving a problem.
- Example: If we are driving in a city we think about the best route (reasoning) and start driving (acting). If we see a road block we change our route (reasoning and acting together).
2. Sequential Steps
- It breaks the problem into smaller steps. After reasoning through each step it takes an action based on what it has figured out so far. This keeps the process moving forward with each action building on the previous reasoning step.
- Example: A robot assigned to clean a room first thinks (reasons) that it needs to pick up items from the floor. After reasoning it acts by picking up the items. Once that’s done robot reasons again that the next step is to vacuum the floor and acts by turning on the vacuum. It continuously reasons and takes action step by step to complete the task.
3. Making Decisions
- It helps AI to make decisions at each step it doesn't wait until the end of the task to act but continuously adjusts its approach as it reasons and acts in real-time.
- Example: If a robot is assigned with the task of opening a door the AI reasons about each door’s features (locked or not) and then takes action based on best fit.
Example
Let's take examples to understand this better:
Prompt 1: "If I have 10 apples and I give away 3 apples, how many apples do I have left?"
Without ReAct (Single Reasoning):
- Model Answer: "I have 7 apples left."
- This is a correct answer but it doesn’t show any reasoning process or action taken to reach the answer.
With ReAct Prompting (Reasoning and Action Together):
- Response 1: "I start with 10 apples. My first action is to subtract 3 apples which gives me 7 apples."
- Action: Subtract 3 apples from 10 to get 7 apples.
- Response 2: "I have 10 apples. After giving away 3, I subtract 3 and I have 7 apples left."
- Action: Subtracting 3 apples results in 7 apples.
Final Answer: It shows both reasoning and action which helps in making problem-solving process more interactive and step-by-step.
Prompt 2: "You have a basket of 12 oranges and you buy 5 more. How many oranges do you have now?"
Without ReAct (Single Reasoning):
- Model Answer: "I have 17 oranges."
- While answer is correct model doesn't show the reasoning process or actions it took to arrive at the result.
With ReAct Prompting (Reasoning and Action Together):
- Response 1: "I start with 12 oranges. My action is to add 5 more oranges, so now I have 17 oranges."
- Action: Add 5 oranges to 12 to get 17 oranges.
- Response 2: "I have 12 oranges and when I buy 5 more, the action is adding them together, giving me 17 oranges."
- Action: Adding 5 oranges results in 17 oranges.
Final Answer: It shows both reasoning (12 + 5) and action (adding the oranges) which makes the solution more interactive and helps in explaining the steps clearly.
How ReAct Models Learn from Thought-Action Sequences
ReAct models learn through a method called few-shot prompting where they learn from a small set of examples and apply that knowledge to new tasks. Here's how it works:
- Learning from Combined Reasoning and Actions: Model is trained to combine thinking and acting. It learns how to think about a problem and take immediate actions based on its reasoning which helps in taking appropriate action similar to how humans solve problems.
- Linking Reasoning and Action: After each action model evaluates if the result is same as expected or not if not then it adjusts its next action based on that feedback.
- Adapting Knowledge to New Tasks: Through few-shot learning model can apply the reasoning and action process to new situations while adjusting to tasks it has never seen before.
- Dynamic Flexibility in Decision-Making: Model is capable of adjusting its reasoning and actions based on real-time feedback. When an action doesn’t lead to the expected result then it learns to modify its next step by considering different actions.
- Enhancing Learning with Fine-Tuning: Fine-tuning helps it in refining the reasoning and action-taking abilities which helps in increasing the model’s accuracy in real-world applications.
Advantages
- Improves problem-solving by combining thinking and action for step-by-step decisions
- Enables faster decisions by reasoning and acting simultaneously
- Makes AI more dynamic by adjusting actions based on ongoing reasoning
- Supports real-time adaptability by responding to changing situations instantly
Limitations
- Increases complexity as the model must decide the right action at each step
- Requires more computational resources due to simultaneous reasoning and acting
- Makes error handling difficult since wrong reasoning can lead to incorrect actions
- Can lead to poor outcomes when quick decisions are made without sufficient reasoning
