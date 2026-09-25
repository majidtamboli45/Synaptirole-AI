# based Gradient Optimizer

> Source: https://www.geeksforgeeks.org/machine-learning/ml-momentum-based-gradient-optimizer-introduction/

Momentum-based optimizers improve standard gradient descent by adding a momentum term that helps move more efficiently across the loss surface.
- Uses past gradients to accelerate learning
- Reduces oscillations during training
- Helps achieve faster convergence
- Improves performance in deep networks and large datasets
Momentum in Gradient Optimization
Momentum is inspired by physics, where movement depends on both current force and past velocity. In optimization, it helps smooth the learning process by incorporating past gradients, leading to faster and more stable convergence.
- Uses past gradients to guide current updates
- Reduces oscillations during training
- Accelerates convergence, especially in deep networks
- Helps move efficiently across the loss surface
Formula:
v_{t+1} = \beta v_t + (1 - \beta) \nabla L(w_t) w_{t+1} = w_t - \eta v_{t+1} 
Where:
- v_t is the velocity i.e., a running average of gradients
- \beta is the momentum factor, typically a value between 0 and 1 (often around 0.9)
- \nabla L(w_t) is the current gradient of the loss function
- \eta is the learning rate
Understanding Hyperparameters:
- Learning Rate (\eta ): The learning rate determines the size of the step taken during each update. It plays a crucial role in both standard gradient descent and momentum-based optimizers.
- Momentum Factor (\beta ): This controls how much of the past gradients are remembered in the current update. A value close to 1 means the optimizer will have more inertia while a value closer to 0 means less reliance on past gradients.
Working of the Algorithm:
- Velocity Update: The velocity v_t  is updated by considering both the previous velocity which represents the momentum and the current gradient. The momentum factor\beta controls the contribution of the previous velocity to the current update.
- Weight Update: The weights are updated using the velocity v_{t+1}  which is a weighted average of the past gradients and the current gradient.
Types of Momentum-Based Optimizers
There are several variations of momentum-based optimizers each with slight modifications to the basic momentum algorithm
1. Nesterov Accelerated Gradient (NAG)
Nesterov Accelerated Gradient is an improved version of momentum optimization that computes the gradient at a look-ahead position, leading to more accurate and faster updates.
- Computes gradient at a future (look-ahead) position instead of the current position
- Provides better direction for updates compared to standard momentum
- Helps achieve faster and more stable convergence
- Improves performance in some deep learning scenarios
Formula:
v_{t+1} = \beta v_t + \nabla L(w_t - \eta \beta v_t) w_{t+1} = w_t - \eta v_{t+1} 
2. AdaMomentum
AdaMomentum is an advanced optimization technique that combines adaptive learning rates with momentum, allowing the optimizer to adjust more effectively based on recent gradient information.
- Combines momentum with adaptive learning rate techniques
- Adjusts momentum based on recent gradients
- Improves sensitivity to the loss landscape
- Helps achieve smoother and more stable convergence
- Useful for fine-tuning model performance
Formula:
v_{t+1} = \beta v_t + (1 - \beta)\nabla L(w_t) w_{t+1} = w_t - \eta_t \, v_{t+1} 
3. RMSProp (Root Mean Square Propagation)
RMSProp is an optimization algorithm that adapts the learning rate for each parameter, helping improve training stability, especially for complex and non-stationary problems.
- Adjusts learning rate individually for each parameter
- Uses moving average of squared gradients
- Helps handle non-stationary objectives (e.g., in RNNs)
- Reduces oscillations during training
- Improves convergence speed and stability
Formula:
s_{t+1} = \beta s_t + (1 - \beta)\left(\nabla L(w_t)\right)^2 w_{t+1} = w_t - \frac{\eta}{\sqrt{s_{t+1}} + \epsilon} \nabla L(w_t) 
Advantages
- Accelerates convergence by leveraging past gradients, helping move faster through flat regions
- Reduces oscillations by maintaining consistent update directions
- Improves generalization by smoothing the optimization process
- Helps escape local minima by maintaining sufficient update momentum
Challenges
- Choosing appropriate learning rate and momentum factor can be difficult and task-dependent
- Large momentum values can cause overshooting, especially with noisy gradients
- Poor initialization of momentum can lead to slow or unstable convergence
