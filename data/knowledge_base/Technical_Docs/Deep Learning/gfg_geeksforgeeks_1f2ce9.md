# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/deep-learning/what-is-fine-tuning/

Fine-tuning is a technique that adapts a pre-trained model to a new task. It uses the knowledge learned from training on a large dataset and applies it to a smaller, task-specific dataset, improving performance while reducing training time.
- Uses a pre-trained model as the starting point.
- Adjusts model weights to perform better on a new task.
- Requires less data and training time than training from scratch.
- Commonly used in transfer learning.
- Helps improve performance on domain specific tasks.
Types of Fine-Tuning
Fine-tuning can be performed in different ways depending on the amount of available data, computational resources and the specific requirements of the task.
1. Full Fine-Tuning
In Full Fine-Tuning, all the parameters of the pre-trained model are updated using the new dataset.
- Updates every layer of the model.
- Provides maximum flexibility and performance.
- Requires significant computational resources and training time.
2. Feature Extraction
In Feature Extraction, the pre-trained model is used as a fixed feature extractor and only the final task-specific layers are trained.
- Most layers remain frozen.
- Faster and more computationally efficient.
- Suitable when the new dataset is small.
3. Partial Fine-Tuning
In Partial Fine-Tuning, only selected layers of the model are updated while the remaining layers stay frozen.
- Balances performance and computational cost.
- Preserves general knowledge learned during pre-training.
- Commonly used in practical applications.
4. Parameter-Efficient Fine-Tuning (PEFT)
Parameter-Efficient Fine-Tuning updates only a small subset of model parameters instead of the entire model.
- Reduces memory and storage requirements.
- Faster than full fine-tuning.
- Widely used for large language models.
5. Low-Rank Adaptation (LoRA)
LoRA is a popular PEFT technique that adds small trainable matrices to the model while keeping the original weights frozen.
- Requires fewer trainable parameters.
- Reduces computational cost.
- Commonly used for fine-tuning large language models such as LLMs.
6. Prompt Tuning
Prompt Tuning learns a set of trainable prompts while keeping the model parameters unchanged.
- Requires minimal training resources.
- Useful for adapting large models to new tasks.
- Maintains the original model weights.
Working of Fine-Tuning
Fine-tuning typically involves the following steps
1. Select a Pre-Trained Model
- Choose a model that has already been trained on a large and diverse dataset.
- Examples include BERT for NLP tasks, ResNet for image classification and GPT models for text generation.
2. Freeze Initial Layers
- The early layers are usually kept unchanged because they have already learned general features.
- For example, image models learn edges, shapes and textures, while language models learn basic grammar and word relationships.
3. Fine-Tune Later Layers
- The later layers are updated using the new dataset.
- These layers learn task-specific patterns and adapt the model to the target application.
4. Use a Small Learning Rate
- A lower learning rate is used to make gradual adjustments to the model's weights.
- This helps preserve previously learned knowledge while allowing the model to adapt to the new task.
5. Evaluate and Refine
- The model is tested on the target task to measure its performance.
- Based on the results, additional layers can be fine-tuned or training parameters can be adjusted to improve accuracy.
Applications
- Used to adapt general-purpose models to specific domains such as healthcare, finance and legal services.
- Improves performance on specialized tasks like sentiment analysis, question answering and named entity recognition.
- Helps models understand specific languages, dialects or writing styles.
- Enables personalization based on user preferences, vocabulary or tone.
- Allows effective learning from smaller datasets without training a model from scratch.
- Supports deployment of optimized models on mobile devices and IoT systems.
Advantages
- Works well even when only a small amount of training data is available.
- Improves performance on domain-specific tasks such as healthcare, finance and legal applications.
- Saves time by adapting an existing model instead of training from scratch.
- Provides better accuracy by leveraging knowledge learned from large datasets.
- Reduces the risk of overfitting on smaller datasets.
- Requires fewer computational resources compared to full model training.
Limitations
- May still suffer from overfitting if the new dataset is too small or lacks diversity.
- Can require significant computational resources, especially for large models.
- Choosing which layers to freeze and which to fine-tune can be challenging.
- Performance depends on the quality and relevance of the pre-trained model.
- May not work well when the new task is very different from the original training task.
