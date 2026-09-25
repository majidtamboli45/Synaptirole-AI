# Policy Gradient Methods in Reinforcement Learning

> Source: https://www.geeksforgeeks.org/machine-learning/policy-gradient-methods-in-reinforcement-learning/

Policy Gradient Methods address these challenges by directly optimizing the policy instead of estimating value functions. A policy is represented by a parameterized function, usually a neural network, that maps the current state to a probability distribution over possible actions.
- Directly optimize the policy without requiring an explicit value function.
- Handle continuous and high-dimensional action spaces effectively.
- Learn stochastic policies that naturally balance exploration and exploitation.
- Scale well to complex environments where value-based methods become impractical.
Mathematical Formulation
Policy Gradient methods learn the optimal policy by maximizing the expected cumulative reward received by the agent. Instead of estimating value functions, they directly optimize the policy parameters using gradient ascent.
1. Policy Function
A policy defines the probability of selecting an action for a given state and is represented as
\pi_\theta(a|s) 
Where:
- s is the current state.
- a is the action selected by the agent.
- \theta represents the trainable parameters of the policy network.
- \pi_\theta(a|s) denotes the probability of choosing action a in state s.
2. Return (Discounted Reward)
The return represents the total reward accumulated from the current time step until the end of an episode.
G_t=\sum_{k=0}^{T-t}\gamma^kR_{t+k} 
Where:
- G_t is the cumulative reward from time step t.
- R_{t+k} is the reward received after taking future actions.
- \gamma is the discount factor(0\le\gamma\le1) .
- T is the final step of the episode.
3. Objective Function
The primary objective of Policy Gradient methods is to maximize the expected return obtained by following the policy.
J(\theta)= {E}_{\pi_\theta} \left[ G_t \right] 
Since 
the objective function can also be written as
J(\theta) = {E}_{\pi_\theta} \left[ \sum_{t=0}^{T} \gamma^tR_t \right] 
This is the main optimization objective in Policy Gradient methods.
Where:
- J(\theta) is the expected cumulative reward.
- E_{\pi_\theta} denotes the expectation under the current policy.
- R_t  is the reward received at time step t.
- \gamma is the discount factor.
4. Policy Gradient Theorem
To maximize the objective function, the gradient of the objective with respect to the policy parameters is computed as
\nabla_\theta J(\theta) = \mathbb{E} \left[ \nabla_\theta \log \pi_\theta(a|s) G_t \right] 
Where:
- \nabla_\theta J(\theta) is the gradient of the objective function.
- \log\pi_\theta(a|s) is the logarithm of the action probability.
- G_t is the cumulative reward.
This theorem provides the direction in which the policy parameters should be updated to maximize the expected reward.
5. Policy Parameter Update
The policy parameters are updated using gradient ascent because the objective is to maximize the expected reward.
\theta_{new} = \theta_{old} + \alpha \nabla_\theta J(\theta)θ 
Where:
- \alpha is the learning rate.
- \nabla_\theta J(\theta) is the policy gradient.
- Each update increases the probability of actions that produce higher rewards.
6. Policy Loss Function
Deep learning libraries minimize a loss function instead of directly maximizing rewards. Therefore, the optimization objective is rewritten as
L(\theta) = - \log \pi_\theta(a|s) G_t 
Where:
- L(θ) is the policy loss.
- \log\pi_\theta(a|s) is the log probability of the selected action.
- G_t is the cumulative reward.
Working
- Step 1: Initialize the Policy Network: The training process begins by initializing a policy network with random parameters \theta . Given the current state, the network outputs a probability distribution over the available actions.
- Step 2: Observe the Current State: The agent observes the current state s_t of the environment. This state serves as the input to the policy network.
- Step 3: Select an Action: The policy network computes the action probabilities and the agent samples an action from this probability distribution instead of always choosing the highest-probability action.
- Step 4: Execute the Action and Receive a Reward: The selected action is executed in the environment. The environment returns an immediate reward R_t and transitions the agent to the next state. This interaction continues until the episode reaches a terminal state.
- Step 5: Compute the Discounted Return: After completing the episode, the cumulative discounted reward is calculated for each time step.
- Step 6: Compute the Policy Gradient: Using the collected states, actions and returns, the policy gradient is calculated according to the Policy Gradient Theorem. This gradient determines how the policy parameters should change to increase the probability of actions that produce higher cumulative rewards.
- Step 7: Update the Policy Parameters: the policy parameters are updated using gradient ascent. After the update, the improved policy is used in the next training episode and the process is repeated until the policy converges or the desired performance is achieved.
Implementation
In this implementation, we create a simple policy network that predicts action probabilities for a given state. The selected action is rewarded based on the environment and the policy parameters are updated using the policy gradient loss.
Step 1: Import Required Libraries
Import the required PyTorch modules for building the policy network and optimizing its parameters.
- torch provides tensor operations required for deep learning.
- torch.nn is used to build the neural network.
- torch.optim provides optimization algorithms such as Adam.
import torch
import torch.nn as nn
import torch.optim as optim
Step 2: Create the Policy Network
Define a simple neural network that takes the current state as input and outputs the probability of selecting each action.
class PolicyNetwork(nn.Module):
    def __init__(self):
        super().__init__()
        self.fc1 = nn.Linear(4, 16)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(16, 2)
        self.softmax = nn.Softmax(dim=-1)
    def forward(self, x):
        x = self.relu(self.fc1(x))
        x = self.softmax(self.fc2(x))
        return x
Step 3: Initialize the Model and Optimizer
Create the policy network and initialize the Adam optimizer.
policy = PolicyNetwork()
optimizer = optim.Adam(policy.parameters(), lr=0.01)
Step 4: Define the Current State
Create a sample state represented by four features.
state = torch.tensor([0.5, 0.2, 0.8, 0.1], dtype=torch.float32)
Step 5: Predict Action Probabilities
Pass the state through the policy network to obtain the probability distribution over the available actions. The output represents the probability of selecting each action.
action_probs = policy(state)
print(action_probs)
Output:
tensor([0.3584, 0.6416], grad_fn=<SoftmaxBackward0>)
Step 6: Sample an Action
Sample an action according to the predicted probability distribution.
distribution = torch.distributions.Categorical(action_probs)
action = distribution.sample()
print("Selected Action:", action.item())
Output:
Selected Action: 0
Step 7: Compute the Policy Loss
Assume the agent receives a reward after executing the selected action. The policy loss is computed using the log probability of the selected action multiplied by the received reward.
reward = torch.tensor(2.0)
loss = -distribution.log_prob(action) * reward
print(loss)
Output:
tensor(2.0525, grad_fn=<MulBackward0>)
Step 8: Update the Policy Parameters
Use backpropagation and the Adam optimizer to update the policy network.
optimizer.zero_grad()
loss.backward()
optimizer.step()
In this implementation:
- A policy network receives the current state as input and predicts the probability of each possible action.
- An action is sampled from the predicted probability distribution instead of always choosing the action with the highest probability.
- After executing the selected action, the environment returns a reward.
- The policy loss is computed using the negative log probability of the selected action multiplied by the received reward.
- Finally, backpropagation computes the gradients and the Adam optimizer updates the policy parameters to increase the probability of actions that yield higher rewards.
You can downlaod the complete code from here.
Types of Policy Gradient Methods
1. REINFORCE
REINFORCE is the simplest Policy Gradient algorithm that updates the policy after completing an entire episode using cumulative rewards.
- Updates the policy after each episode.
- Uses cumulative discounted rewards.
- Simple to implement but has high variance.
2. Actor-Critic
Actor-Critic combines an Actor, which selects actions and a Critic, which evaluates them to improve learning.
- Uses separate Actor and Critic networks.
- Reduces variance and improves learning efficiency.
- Supports both discrete and continuous action spaces.
3. Proximal Policy Optimization (PPO)
PPO improves training stability by limiting large policy updates, enabling more reliable learning.
- Restricts large policy updates.
- Provides stable and efficient training.
- Widely used for complex reinforcement learning tasks.
Applications
- Robotics: Train robotic systems to perform continuous control tasks such as grasping, walking and manipulation.
- Autonomous Driving: Learn driving policies for steering, acceleration and braking in dynamic traffic environments.
- Game AI: Develop intelligent agents that learn winning strategies in complex games through interaction.
- Natural Language Processing (NLP): Optimize text generation and dialogue systems using reward-based learning.
- Recommendation Systems: Learn personalized recommendation policies by maximizing long-term user engagement.
- Resource Management: Optimize scheduling and resource allocation in cloud computing and communication networks.
Advantages
- Directly optimize the policy to maximize cumulative rewards.
- Naturally support continuous and high-dimensional action spaces.
- Learn stochastic policies that improve exploration during training.
- Scale effectively to complex reinforcement learning environments.
- Integrate well with deep neural networks for end-to-end learning.
- Form the foundation of advanced algorithms such as Actor-Critic and PPO.
Limitations
- Require a large number of interactions with the environment for effective learning.
- Gradient estimates can have high variance, leading to unstable training.
- Sensitive to hyperparameters such as the learning rate and discount factor.
- May converge to locally optimal policies instead of the global optimum.
