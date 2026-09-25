# Monte Carlo Policy Evaluation

> Source: https://www.geeksforgeeks.org/machine-learning/monte-carlo-policy-evaluation/

Monte Carlo policy evaluation is a technique within the field of reinforcement learning that estimates the effectiveness of a policy—a strategy for making decisions in an environment. It’s a bit like learning the rules of a game by playing it many times, rather than studying its manual. This approach doesn't require a pre-built model of the environment; instead, it learns exclusively from the outcomes of the episodes it experiences. Each episode consists of a sequence of states, actions, and rewards, much like playing rounds of a game, starting from the initial state and continuing until the game ends.
How Monte Carlo Policy Evaluation Works?
The method works by running simulations or episodes where an agent interacts with the environment until it reaches a terminal state. At the end of each episode, the algorithm looks back at the states visited and the rewards received to calculate what’s known as the "return" — the cumulative reward starting from a specific state until the end of the episode. Monte Carlo policy evaluation repeatedly simulates episodes, tracking the total rewards that follow each state and then calculating the average. These averages give an estimate of the state value under the policy being followed.
By aggregating the results over many episodes, the method converges to the true value of each state when following the policy. These values are useful because they help us understand which states are more valuable and thus guide the agent toward better decision-making in the future. Over time, as the agent learns the value of different states, it can refine its policy, favouring actions that lead to higher rewards.
Concepts Related to Monte Carlo Policy Evaluation:
Monte Carlo policy evaluation is like a trial-and-error learning method where you understand the value of actions by repeatedly trying them and observing the outcomes. Imagine you're in a maze and each move either gets you closer to the exit or takes you to a dead end. If you try many different paths, over time, you'll learn which turns are likely to be dead ends and which ones lead to the exit.
In reinforcement learning, each complete walkthrough of the maze is an "episode," and the Monte Carlo method uses many such episodes to figure out how good or bad it is to be in a certain spot in the maze (a "state"). After many walkthroughs, you start to notice patterns: some spots consistently lead to quick exits, so they are given a high value; others tend to lead to dead ends, so they are valued lower.
The Monte Carlo method waits until the end of the episode, then works backwards to assign a value to each state based on the rewards collected. It doesn't make assumptions about the environment or use complex models; it learns purely from experience. By averaging the total rewards that follow each state, it can estimate the state's value, guiding you to make better decisions in the maze in future runs.
Mathematical Concepts in Monte Carlo Policy Evaluation:
In Monte Carlo policy evaluation, the value V of a state "s" under a policy π is estimated by the average return G following that state. The return is the cumulative reward obtained after visiting state "s":
Here, N(s) is the number of times state "s" is visited across episodes, and Gi is the return from the i-th episode after visiting state "s". This average converges to the expected return as N(s) becomes large:
Each return Gi is calculated by summing discounted rewards from the time state "s" is visited till the end of the episode:
where, γ is the discount factor (between 0 and 1) and R is the reward at each time step. This reflects the idea that rewards in the near future are more valuable than rewards further in the future.
Implementation Of Monte Carlo Policy Evaluation
import numpy as np
# Define a simple environment with deterministic transitions
# For simplicity, let's assume there are 5 states and 
# moving from one state to the next gives a reward of 1, with state 4 being terminal
class SimpleEnvironment:
    def __init__(self, num_states=5):
        self.num_states = num_states
    def step(self, state):
        reward = 0
        terminal = False
        if state < self.num_states - 1:
            next_state = state + 1
            reward = 1
        else:
            next_state = state
            terminal = True
        return next_state, reward, terminal
    def reset(self):
        return 0  # Start from state 0
# Define a random policy for the sake of demonstration
def random_policy(state, num_actions=5):
    return np.random.choice(num_actions)
# Monte Carlo Policy Evaluation function
def monte_carlo_policy_evaluation(policy, env, num_episodes, gamma=1.0):
    value_table = np.zeros(env.num_states)
    returns = {state: [] for state in range(env.num_states)}
    for _ in range(num_episodes):
        state = env.reset()
        episode = []
        # Generate an episode
        while True:
            action = policy(state)
            next_state, reward, terminal = env.step(action)
            episode.append((state, reward))
            if terminal:
                break
            state = next_state
        # Calculate the return and update the value table
        G = 0
        for state, reward in reversed(episode):
            G = gamma * G + reward
            returns[state].append(G)
            value_table[state] = np.mean(returns[state])
    return value_table
# Define the number of episodes for MC evaluation
num_episodes = 1000
# Create a simple environment instance
env = SimpleEnvironment(num_states=5)
# Evaluate the policy
v = monte_carlo_policy_evaluation(random_policy, env, num_episodes)
print("The value table is:")
print(v)
Output:
The value table is:
[3.916 3.84516129 3.92213115 4.07630522 4.10453649]
Code Explanation:
- Environment Setup: The SimpleEnvironment class represents a simple sequential environment with 5 states. Moving from one state to the next yields a reward, and the last state is terminal.
- Step Function: The step method defines the transition logic from one state to the next and issues a reward. If the terminal state is reached, it signals the end of an episode.
- Policy Function: random_policy randomly selects an action, demonstrating a naive decision-making strategy for the agent within the environment.
- Monte Carlo Function: monte_carlo_policy_evaluation evaluates the given policy by simulating episodes and calculating the average return for each state after many trials. It updates the value table to reflect the average returns.
- Return Calculation: In each episode, after the agent reaches a terminal state, the function calculates the total discounted return from each state in reverse order.
- Value Update: The function stores return and updates the estimated value of each state by averaging the returns observed from that state across all episodes.
- Execution: The Monte Carlo policy evaluation is run for num_episodes, with the results printed out as the value for each state in the environment.
This code provides an estimate of how good it is to be in each state under a policy that makes random decisions, using the average returns from many simulated episodes.
The output shows the estimated value of being in each state from 0 to 4 in the environment. These values represent the average total reward an agent can expect to receive starting from that state and following the random policy. Higher values suggest that starting from those states is more advantageous under this policy.
Advantages of Monte Carlo Policy Evaluation:
- No Model Required: It doesn't need a model of the environment's dynamics, as it learns directly from experience, making it ideal for complex or unknown environments.
- Simple Implementation: The algorithm is straightforward to implement since it averages returns from episodes without requiring intricate mathematical calculations or estimations.
- Flexible to Variability: It can handle stochastic policies and environments since it considers a range of possible outcomes through sampling.
Disadvantages of Monte Carlo Policy Evaluation:
- High Variance: It can exhibit high variance in estimates since outcomes from different episodes may vary widely, especially with fewer episodes.
- Inefficiency with Long Episodes: It becomes less efficient with long episodes or delayed rewards, as it must wait until the end of an episode to update values.
- Lack of Bootstrap: Unlike other methods, it does not bootstrap (update estimates based on other estimates), which can slow down the learning process in large state spaces.
Conclusion
In conclusion, Monte Carlo policy evaluation is like learning through full experience. It's a hands-on way to measure how effective certain actions are, based on the rewards they yield over many trials. While it's not perfect and can be a bit slow, it's a practical approach, especially when we're stepping into new territory without a guide.
