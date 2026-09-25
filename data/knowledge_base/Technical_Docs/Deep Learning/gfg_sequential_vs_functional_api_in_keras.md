# Sequential vs Functional API in Keras

> Source: https://www.geeksforgeeks.org/deep-learning/sequential-vs-functional-api-in-keras/

Keras provides two approaches for building deep learning models, Sequential API and Functional API. Both are used to create neural networks, but they differ in terms of flexibility and model design.
- Sequential API is suitable for models where layers are arranged in a simple linear sequence.
- Functional API is more flexible and supports complex architectures with multiple inputs, outputs, branching and shared layers.
Sequential API
It is the simplest way to build a neural network in Keras. Layers are added one after another, creating a single flow of data from input to output.
- Easy to understand and implement.
- Suitable for simple feedforward neural networks.
- Follows a linear stack of layers.
- Ideal for beginners and basic deep learning tasks.
Functional API
It provides greater flexibility and allows developers to create more complex neural network architectures. Instead of stacking layers sequentially, layers are connected explicitly.
- Supports multiple inputs and outputs.
- Allows non-linear architectures.
- Enables shared layers and skip connections.
- Suitable for advanced deep learning models.
Key Difference
| Feature | Sequential API | Functional API | 
|---|---|---|
| Structure | Linear stack of layers | Flexible graph of layers | 
| Model Architecture | Suitable for simple models | Supports complex models | 
| Multiple Inputs/Outputs | Not supported | Supported | 
| Skip Connections | Not supported | Supported | 
| Layer Sharing | Not supported | Supported | 
| Ease of Use | Easier and beginner-friendly | Slightly more advanced | 
| Best Used For | Simple feedforward networks | CNNs, ResNets, multi-input/output models |
