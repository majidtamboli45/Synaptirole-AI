# RMSProp Optimizer in Deep Learning

> Source: https://www.geeksforgeeks.org/deep-learning/rmsprop-optimizer-in-deep-learning/

RMSProp is an adaptive optimization algorithm that improves training speed and stability by adjusting the learning rate for each parameter based on recent gradients.
- Adapts the learning rate individually for each parameter
- Uses the magnitude of recent gradients to scale updates
- Handles non-stationary objectives effectively
- Works well with sparse gradients
- Commonly used in deep learning for faster and more stable training
Need of RMSProp Optimizer
RMSProp was developed to overcome limitations of earlier methods like SGD and Adagrad by improving learning rate adaptation.
- SGD uses a constant learning rate, which can be inefficient
- Adagrad decreases the learning rate too quickly over time
- RMSProp uses a moving average of squared gradients to adapt learning rates
- Maintains a balance between fast convergence and training stability
- Widely used in deep learning for efficient optimization
Working of RMSProp Optimizer
RMSProp works by maintaining a moving average of squared gradients to normalize updates and adapt the learning rate for each parameter.
- Keeps a moving average of squared gradients
- Prevents learning rate from becoming too small (issue in Adagrad)
- Scales updates appropriately for each parameter
- Handles non-stationary objectives effectively
- Suitable for training deep neural networks
Formula:
1. Compute the gradient 
g t =∇ θ 
2. Update the moving average of squared gradients
E[g^2]_t = \gamma E[g^2]_{t-1} + (1 - \gamma) 
where 
3. Update the parameter 
\theta_{t+1} = \theta_t - \frac{\eta}{\sqrt{E[g^2]_t + \epsilon}} 
where 
Parameters Used in RMSProp
- Learning Rate (\eta ): Controls the step size during the parameter updates. RMSProp typically uses a default learning rate of 0.001, but it can be adjusted based on the specific problem.
- Decay Rate (\gamma ): Determines how quickly the moving average of squared gradients decays. A common default value is 0.9 which balances the contribution of recent and past gradients.
- Epsilon (\epsilon ): A small constant added to the denominator to prevent division by zero and ensure numerical stability. A typical value for\epsilon is 1e-8.
Implementing RMSprop in Python
We will use the following code line for initializing the RMSProp optimizer with hyperparameters
tf.keras.optimizers.RMSprop(learning_rate=0.001, rho=0.9)
- learning_rate = 0.001: Determines the step size for weight updates; smaller values lead to finer updates and help avoid overshooting the minimum
- rho=0.9: Controls the decay rate of past squared gradients, balancing the influence of previous and current gradients
1. Importing Libraries
We are importing libraries to implement RMSprop optimizer, handle datasets, build the model and plot results.
- tensorflow.keras for deep learning components.
- matplotlib.pyplot for visualization.
import tensorflow as tf
from tensorflow.keras.datasets import mnist
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.utils import to_categorical
import matplotlib.pyplot as plt
2. Loading and Preprocessing Dataset
We load the MNIST dataset, normalize pixel values to [0,1] and one-hot encode labels.
- mnist.load_data() loads images and labels.
- Normalization improves training stability.
- to_categorical() converts labels to one-hot vectors.
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train = x_train.astype('float32') / 255.0
x_test = x_test.astype('float32') / 255.0
y_train = to_categorical(y_train, 10)
y_test = to_categorical(y_test, 10)
3. Building the Model
We define a neural network using Sequential with input flattening and dense layers.
- Flatten converts 2D images to 1D vectors.
- Dense layers learn patterns with ReLU and softmax activations.
model = Sequential([
    Flatten(input_shape=(28, 28)),
    Dense(128, activation='relu'),
    Dense(64, activation='relu'),
    Dense(10, activation='softmax')
])
4. Compiling the Model
We compile the model using the RMSprop optimizer for adaptive learning rates, categorical cross-entropy loss for multi-class classification and track accuracy metric.
- RMSprop adjusts learning rates based on recent gradients (parameter rho controls decay rate).
- categorical_crossentropy suits one-hot encoded labels.
model.compile(optimizer=tf.keras.optimizers.RMSprop(learning_rate=0.001, rho=0.9),
              loss='categorical_crossentropy',
              metrics=['accuracy'])
5. Training the Model
We train the model over 10 epochs with batch size 32 and validate on 20% of training data. validation_split monitors model performance on unseen data each epoch.
history = model.fit(x_train, y_train, epochs=10,
                    batch_size=32, validation_split=0.2)
Output:
6. Evaluating and Visualizing Results
We evaluate test accuracy on unseen test data and plot training and validation loss curves to visualize learning progress.
loss, accuracy = model.evaluate(x_test, y_test)
print(f'Test accuracy: {accuracy:.4f}')
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.title('Cost Function Graph')
plt.legend()
plt.show()
Output:
Advantages
- Adjusts learning rates individually for each parameter for better updates
- Handles non-stationary objectives effectively
- Avoids rapid learning rate decay seen in Adagrad
- Provides faster and more stable convergence
Disadvantages
- Sensitive to hyperparameters like decay rate and epsilon, requiring careful tuning
- May perform poorly with sparse data, leading to slower or unstable convergence
