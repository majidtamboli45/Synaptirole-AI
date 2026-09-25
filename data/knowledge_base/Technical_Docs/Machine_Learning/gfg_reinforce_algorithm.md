# REINFORCE Algorithm

> Source: https://www.geeksforgeeks.org/machine-learning/reinforce-algorithm/

REINFORCE is a policy gradient reinforcement learning algorithm that learns an optimal policy by directly optimizing the probability of selecting actions that maximize the expected cumulative reward. Instead of estimating value functions such as state values or action values, REINFORCE updates the policy parameters using the rewards collected from complete episodes.
Working
1. Collect Episodes: The agent interacts with the environment for a fixed number of steps or until an episode is complete, following the current policy. This generates a trajectory consisting of states, actions and rewards.
2. Calculate Returns: For each time step 
G_t = \sum_{k=t}^T \gamma^{k-t} 
Where 
3. Policy Gradient Update: The policy parameters 
\theta_{t+1} = \theta_t + \alpha \nabla_{\theta} \log \pi_{\theta}(a_t | s_t) G_t 
Where:
- α is the learning rate.
- \pi_{\theta}(a_t | s_t) is the probability of taking actiona_t  at states_t , according to the policy.
- G_t is the return or cumulative reward obtained from time stept onwards.
- The gradient \nabla_{\theta} \log \pi_{\theta}(a_t | s_t) represents how much the policy probability for actiona_t  at states_t should be adjusted based on the obtained return.
4. Repeat: This process is repeated for several episodes, iteratively updating the policy in the direction of higher rewards.
Implementation
In this example we will train a policy network to solve a basic environment such as CartPole from OpenAI's gym. The aim is to use REINFORCE to directly optimize the policy without using value function approximations.
Step 1: Set Up the Environment
The first step is to create the environment using OpenAI's Gym. For this example we use the CartPole-v1 environment where the agent's task is to balance a pole on a cart.
import gym
import numpy as np
import tensorflow as tf
from tensorflow.keras import layers
env = gym.make('CartPole-v1')
obs_space = env.observation_space.shape[0]
act_space = env.action_space.n
Step 2: Define Hyperparameters
In this step we define hyperparameters for the algorithm like discount factor gamma, the learning rate, number of episodes and batch size. These hyperparameters control how the algorithm behaves during training.
gamma = 0.99
learning_rate = 0.01
num_episodes = 1000
batch_size = 64
Step 3: Define the Policy Network (Actor)
We define the policy network as a simple neural network with two dense layers. The input to the network is the state and the output is a probability distribution over the actions (softmax output). The network learns the policy that maps states to action probabilities.
class PolicyNetwork(tf.keras.Model):
    def __init__(self, hidden_units=128):
        super(PolicyNetwork, self).__init__()
        self.dense1 = layers.Dense(hidden_units, activation='relu')
        self.dense2 = layers.Dense(env.action_space.n, activation='softmax')
    def call(self, state):
        x = self.dense1(state)
        return self.dense2(x)
Step 4: Initialize the Policy & Optimizer
Here, we initialize the policy network and the Adam optimizer. The optimizer is used to update the weights of the policy network during training.
policy = PolicyNetwork()
optimizer = tf.keras.optimizers.Adam(learning_rate)
Step 5: Compute Returns
In reinforcement learning, the return 
def compute_returns(rewards, gamma):
    returns = np.zeros_like(rewards, dtype=np.float32)
    running_return = 0
    for t in reversed(range(len(rewards))):
        running_return = rewards[t] + gamma * running_return
        returns[t] = running_return
    return returns
Step 6: Define Training Step
The training step computes the gradients of the policy network using the log of action probabilities and the computed returns. The loss is the negative log-likelihood of the actions taken, weighted by the return. The optimizer updates the policy network’s parameters to maximize the expected return.
def train_step(states, actions, returns):
    with tf.GradientTape() as tape:
        # Calculate the probability of each action taken
        action_probs = policy(states)
        action_indices = np.array(actions, dtype=np.int32)
        # Gather the probabilities for the actions taken
        action_log_probs = tf.math.log(tf.reduce_sum(
            action_probs * tf.one_hot(action_indices, env.action_space.n), axis=1))
        # Calculate the loss (negative log likelihood * returns)
        loss = -tf.reduce_mean(action_log_probs * returns)
    grads = tape.gradient(loss, policy.trainable_variables)
    optimizer.apply_gradients(zip(grads, policy.trainable_variables))
Step 7: Training Loop
The training loop collects experiences from episodes and then performs training in batches. The policy is updated after each batch of experiences. In each episode, we record the states, actions and rewards and then compute the returns. The policy is updated based on these returns.
for episode in range(num_episodes):
    state, _ = env.reset()
    done = False
    states, actions, rewards = [], [], []
    while not done:
        state_input = np.array(state, dtype=np.float32).reshape(1, -1)
        probs = policy(state_input).numpy()[0]
        action = np.random.choice(act_space, p=probs)
        next_state, reward, terminated, truncated, _ = env.step(action)
        done = terminated or truncated
        states.append(state_input[0])
        actions.append(action)
        rewards.append(reward)
        state = next_state
    # After episode ends
    returns = compute_returns(rewards, gamma)
    returns = (returns - np.mean(returns)) / (np.std(returns) + 1e-9)
    states_batch = np.vstack(states)
    train_step(states_batch, actions, returns)
    if episode % 100 == 0:
        print(f"Episode {episode}/{num_episodes}")
Step 8: Testing the Trained Agent
After training the agent, we evaluate its performance by letting it run in the environment without updating the policy. The agent chooses actions based on the highest probabilities (greedy behavior).
state, _ = env.reset()
done = False
total_reward = 0
while not done:
    state_input = np.array(state, dtype=np.float32).reshape(1, -1)
    probs = policy(state_input).numpy()[0]
    action = np.argmax(probs)
    next_state, reward, terminated, truncated, _ = env.step(action)
    done = terminated or truncated
    total_reward += reward
    state = next_state
print(f"Test Total Reward: {total_reward}")
Output:
Episode 0/1000
Episode 100/1000
Episode 200/1000
Episode 300/1000
Episode 400/1000
Episode 500/1000
Episode 600/1000
Episode 700/1000
Episode 800/1000
Episode 900/1000
Test Total Reward: 49.0
You can download the complete code from here.
Variants of REINFORCE Algorithm
Several modifications to the original REINFORCE algorithm have been proposed to address its high variance:
Baseline: By subtracting a baseline value (typically the value function 
The update rule becomes:
\theta_{t+1} = \theta_t + \alpha \nabla_{\theta} \log \pi_{\theta}(a_t | s_t) (G_t - b_t) 
- Where b_t  is the baseline such as the expected reward from states_t .
Actor-Critic: It is a method that use two parts to learn better: the actor and the critic. The actor chooses what action to take while the critic checks how good that action was and give feedback. This helps to make learning more stable and faster by reducing random mistakes.
Applications
- Robotics: REINFORCE helps robots to learn how to do things like picking up objects or moving around. The robot try different actions and learn from what works well or not.
- Game AI: It is used to teach game players like in video games or board games like chess. The player learns by playing the game many times and figure out what moves led to win.
- Self-driving cars: REINFORCE can help improve how self-driving cars decide to drive safely and efficiently by rewarding good driving decisions.
Advantages
- REINFORCE is simple and easy to use and a good way to start learning about how to improve decision in reinforcement learning.
- It works by directly improving the way actions are chosen which is helpful when there are many possible actions or choices.
- It works well when tasks have a clear finish and the agent gets a total reward at the end.
Challenges
- Policy updates are based on complete episode returns, making learning unstable.
- Requires many interactions with the environment before achieving good performance.
- Learning can take a long time, especially in environments with sparse rewards.
- Since updates occur only after an episode finishes, the algorithm cannot immediately learn from individual actions.
