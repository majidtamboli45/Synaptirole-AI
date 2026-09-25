# Elu Activation Function in Neural Network

> Source: https://www.geeksforgeeks.org/deep-learning/elu-activation-function-in-neural-network/

ELU is a activation function used in neural networks which is an advanced version of widely used relu activation function. But before understanding ELU it's important to recognize the shortcomings of ReLU and Leaky ReLU activation function
- ReLU returns 0 for any negative input. This leads to the "dying ReLU" problem where some neurons stop learning entirely due to zero gradients.
- Leaky ReLU solves this by allowing a small, non-zero gradient for negative values. However its slope is fixed and may not be ideal in all situations.
- Both functions are non-differentiable at x = 0 which can slightly affect optimization.
To address these issues more effectively ELU function was introduced. Exponential Linear Unit (ELU) is an activation function that modifies the negative part of ReLU by applying an exponential curve. It allows small negative values instead of zero which improves learning dynamics.
Characteristics of the ELU Graph
1. For x > 0
- The ELU function behaves like the identity function.
- It increases linearly with a slope of 1.
- Formula: f(x) = x
- This part of the curve looks like a straight diagonal line which is similar to ReLU.
2. For x ≤ 0
- The function curves smoothly and negatively.
- Formula: f(x) = α (exp(x) - 1) and commonly α is 1
- Unlike ReLU the output does not become zero or flat. Instead it gently approaches a minimum value which is typically -1 if α = 1.
- The curve is smooth, continuous and differentiable gradually transitioning at x = 0.
Mathematically it is:
f(x) = x, if x > 0
f(x) = α (exp(x) - 1), if x ≤ 0
Where α (alpha) is a hyperparameter that controls the saturation level for negative inputs. Commonly α is set to 1.
Features of ELU
- Prevents Dying Neurons: Unlike ReLU it provides a non-zero gradient for negative inputs ensuring all neurons remain active during training.
- Faster Learning: It brings activations closer to zero mean helping gradients to flow more smoothly and speeding up convergence.
- Smooth Output: ELU is continuous and differentiable at all points including zero. This makes gradient-based optimization more stable.
- Negative Saturation: For large negative inputs the output saturates at –α which helps reduce variance in neuron outputs and stabilizes learning.
- Better Performance in Deep Networks: Due to its smoother and zero-centered behavior, ELU often outperforms ReLU and Leaky ReLU in deeper architectures.
