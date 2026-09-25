# PyTorch DataLoader

> Source: https://www.geeksforgeeks.org/deep-learning/pytorch-dataloader/

PyTorch's DataLoader is a powerful tool for efficiently loading and processing data for training deep learning models. It provides functionalities for batching, shuffling, and processing data, making it easier to work with large datasets. In this article, we'll explore how PyTorch's DataLoader works and how you can use it to streamline your data pipeline.
What is Pytorch DataLoader?
PyTorch Dataloader is a utility class designed to simplify loading and iterating over datasets while training deep learning models. It has various constraints to iterating datasets, like batching, shuffling, and processing data. To implement the dataloader in Pytorch, we have to import the function by the following code,
from torch.utils.data import Dataset, DataLoader
Importance of Batching, Shuffling, and Processing in Deep Learning
To improve the stability, efficiency, and generalization of the model, batching, shuffling, and processing are used for effective computation in data preparation. Let's look at the importance of each constraint separately,
- Batching: Batching processes the data in batches, which helps to leverage hardware capabilities by parallel processing to improve efficiency. It allows the model to process data in smaller chunks (batches) instead of the entire dataset at once. This reduces the memory footprint required during training, making it feasible to train on larger datasets or models with limited memory resources. During training, the model updates its internal parameters based on the gradients calculated from the loss function. Batching provides a balance between computational efficiency and the accuracy of gradient updates.
- Shuffling: Shuffling prevents the model from biased learning of dataset. Shuffling the data order in each epoch ensures the model encounters data points in different combinations, forcing it to learn generalizable features rather than memorizing specific data order. Thus, it prevents from Overfitting. Shuffling helps the model avoid getting stuck in local minima during training by exposing it to a more diverse set of data combinations in each epoch to provide more stability.
- Processing : Processing helps to transform data to improve model stability and robustness. Processing steps like normalization, scaling, and handling missing values ensure the data is clean and suitable for the model's input format. This improves the quality of data fed to the model, leading to better training outcomes. Data augmentation techniques like random cropping, flipping, or adding noise can be applied during processing to artificially increase the size and diversity of the training data. This helps the model become more robust to variations in real-world data and improve generalization.
Batching
Batching is the process of grouping data samples into smaller chunks (batches) for efficient training. Automatic batching is the default behavior of DataLoader. When batch_size is specified, the DataLoader automatically collates individual fetched data samples into batches, typically with the first dimension representing as the batch dimension.
How DataLoader creates mini-batches?
When you create a DataLoader just specify the batch_size to create a mini-batches. During training, the DataLoader slices your dataset into multiple mini-batches for the given batch size. Each batch contains multiple data points (e.g., images, text samples) . The DataLoader returns the batched data (input features and labels) to the training loop.
batch_size (int, optional) -> how many samples per batch to load (default: 1).
import torch
from torch.utils.data import DataLoader, TensorDataset
# sample dummy image tensors
image_data = torch.randn(1000, 3, 64, 64) 
labels = torch.randint(0, 10, (1000,))  
dataset = TensorDataset(image_data, labels)
#Split into batches
batch_size = 32
dataloader = DataLoader(dataset, batch_size=batch_size, shuffle=True)
#to view every iterated batch
for batch_images, batch_labels in dataloader:
    print(f"Batch shape: {batch_images.shape}, Labels: {batch_labels}")
Output:
Batch shape: torch.Size([32, 3, 64, 64]), Labels: tensor([0, 3, 7, 1, 4, 2, 9, 7, 4, 7, 1, 8, 3, 4, 6, 3, 8, 7, 2, 8, 3, 2, 4, 9,
6, 3, 8, 0, 0, 1, 3, 0])
Batch shape: torch.Size([32, 3, 64, 64]), Labels: tensor([1, 1, 5, 5, 4, 6, 1, 1, 2, 3, 8, 3, 7, 0, 6, 3, 1, 7, 7, 9, 4, 0, 8, 0,
7, 4, 8, 1, 0, 6, 2, 5])
Batch shape: torch.Size([32, 3, 64, 64]), Labels: tensor([8, 2, 6, 2, 8, 2, 0, 0, 4, 4, 9, 4, 8, 5, 2, 7, 6, 5, 0, 5, 4, 3, 9, 8,
8, 8, 1, 7, 7, 1, 7, 9])
Batch shape: torch.Size([32, 3, 64, 64]), Labels: tensor([6, 6, 9, 3, 7, 2, 3, 6, 9, 4, 7, 8, 7, 7, 9, 4, 8, 3, 9, 9, 9, 9, 4, 2,
0, 0, 5, 4, 5, 7, 5, 7])
Batch shape: torch.Size([32, 3, 64, 64]), Labels: tensor([3, 0, 2, 3, 7, 8, 0, 6, 6, 9, 1, 4, 6, 2, 7, 9, 1, 2, 9, 8, 4, 6, 2, 3,
7, 3, 5, 3, 6, 7, 3, 1])
Batch shape: torch.Size([32, 3, 64, 64]), Labels: tensor([8, 8, 0, 4, 9, 1, 5, 4, 9, 4, 7, 5, 2, 2, 1, 6, 0, 3, 1, 1, 1, 8, 8, 5,
0, 6, 3, 3, 9, 3, 4, 7])
Batch shape: torch.Size([32, 3, 64, 64]), Labels: tensor([7, 4, 9, 6, 2, 1, 0, 0, 1, 1, 3, 3, 9, 3, 5, 7, 0, 2, 3, 5, 9, 2, 3, 0,
9, 9, 0, 1, 9, 0, 3, 2])
The above results indicates a batch of 32 images, each with 3 channels and a size of 64x64 pixels. The batch_labels will be a tensor of shape (32,) containing the class labels for each image in the batch.
Benefits of using mini-batches
- Mini-Batches allows for parallel processing on GPUs. Thus, it speeds up computation.
- It reduces the memory required by processing in batches not an entire dataset at once.
- It is feasible to train larger datasets by memory optimization and reduces the overhead.
- It provides a stable update to model weights.
Choosing the right batch size
The smaller batch sizes leads to a stable training which results in noisy updates. On Larger batch size leads to faster convergence and excessively larger batches results in slower convergence. So it is beneficial to experiment with different batch sizes and monitor the training performance to determine a optimal batch size. For most of the cases , batch size of 64 for larger model and 32 for smaller datasets are used often.
Shuffling
Shuffling means the random reordering of data samples for every epoch to improve the model performance and generalization shuffling was used. By setting shuffle (True), internally random sampler was used.
Enabling shuffling with the shuffle argument
When shuffle=True, the DataLoader randomly rearranges the data at the start of each epoch. The DataLoader returns the batched data (input features and labels) to the training loop.
From the code , we can infer that the built-in dataset MNIST was downloaded by shuffle=True. It ensures that the model encounters a diverse mix of samples in each batch.
shuffle (bool, optional) –> set to True to have the data reshuffled at every epoch (default: False).
from torch.utils.data import DataLoader
from torchvision import datasets, transforms
# DataLoader with shuffle = True
train_loader = DataLoader(datasets.MNIST('data', train=True, download=True,
                           transform=transforms.Compose([
                               transforms.ToTensor(),
                               transforms.Normalize((0.1307,), (0.3081,))
                           ])),
                           batch_size=64, shuffle=True)
Difference between shuffle = True & shuffle = False
To see the difference , we'll use a dataset of integers from 0 to 99 as our data points for simplicity. The goal here is not to train a real model but to observe how the order of data points changes with and without shuffling.
import torch
from torch.utils.data import DataLoader, TensorDataset
# Create a synthetic dataset of integers from 0 to 99
data = torch.arange(0, 100)
# Create dummy targets (just for the sake of having them)
targets = torch.zeros(100)
# Create a TensorDataset
dataset = TensorDataset(data, targets)
# DataLoader with shuffle=True
dataloader_shuffle = DataLoader(dataset, batch_size=10, shuffle=True)
# DataLoader with shuffle=False
dataloader_noshuffle = DataLoader(dataset, batch_size=10, shuffle=False)
# Function to print the first batch of the dataloader
def print_first_batch(dataloader, shuffle_status):
    for batch in dataloader:
        data, _ = batch
        print(f"First batch with shuffle={shuffle_status}: {data}")
        break  # We break the loop to print only the first batch
# Print the first batch of each DataLoader to compare
print_first_batch(dataloader_shuffle, shuffle_status=True)
print_first_batch(dataloader_noshuffle, shuffle_status=False)
Output:
First batch with shuffle=True: tensor([53,  0, 56,  3, 92, 49, 72, 79, 64, 47])
First batch with shuffle=False: tensor([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
- With shuffle=True: Each time you run this script, the "First batch with shuffle=True" will contain a different random assortment of integers from 0 to 99. This demonstrates that the DataLoader is shuffling the dataset before each epoch.
- With shuffle=False: Regardless of how many times you run the script, the "First batch with shuffle=False" will always display the first ten integers (0 to 9) in the same order. This shows that the DataLoader is serving the dataset in the same order it was given.
Alternative approaches for shuffling with samplers
Shuffling can also be achieved using custom sampler classes. The Samplers provide flexibility in how you shuffle your dataset and can be used based on your specific requirements. Below we mentioned about the few sampler for a built-in image dataset MNIST .
1. Random Sampler:
This sampler randomly samples elements from the dataset without replacement. It ensures that each example is sampled exactly once in an epoch.
from torch.utils.data import DataLoader, RandomSampler,Dataset
datset=datasets.MNIST(root='./data',train=False,download=True,transform=t)
random_sampler = RandomSampler(dataset)
data_loader = DataLoader(dataset, batch_size=32, sampler=random_sampler)
This shows how to use the built-in RandomSampler to randomly shuffle the entire dataset before each epoch.
2. Sequential Sampler with Shuffle:
This sampler sequentially samples elements from the dataset but shuffles the order of the elements at the beginning of each epoch, providing a balance between randomness and order.
from torch.utils.data import SequentialSampler
sequential_sampler = SequentialSampler(dataset)
data_loader = DataLoader(dataset, batch_size=32, sampler=sequential_sampler)
3. Custom Sampler:
It is used for implementing more complex shuffling strategies or sampling schemes based on specific requirements.A Custom Sampler allows for complex sampling strategies. Below is a simple example of a custom sampler that randomly selects half of the dataset without replacement.
from torch.utils.data import Sampler
import random
class CustomSampler(Sampler):
    def __init__(self, data_source):
        self.data_source = data_source
        self.indices = list(range(len(data_source)))
    def __iter__(self):
        random.shuffle(self.indices)
        return iter(self.indices)
    def __len__(self):
        return len(self.indices)
custom_sampler = CustomSampler(dataset)
data_loader = DataLoader(dataset, batch_size=32, sampler=custom_sampler)
Processing Data
The DataLoader uses single-process data loading by default. In this mode, data fetching is done in the same process a DataLoader is initialized. Thus, data loading may block computing. Processing will be preferred when resources used for sharing data among processes (e.g., shared memory, file descriptors) is limited, or when the entire dataset is small and can be loaded entirely in memory. By processing, it will apply transformations to the data. Transformations include resizing images, normalizing pixel values, or any other preprocessing steps.
import torch
from torch.utils.data import DataLoader
from torchvision import datasets, transforms
import matplotlib.pyplot as plt
#preprocess - transform as tensor
transform = transforms.Compose([
    transforms.RandomResizedCrop(224),
    transforms.RandomHorizontalFlip(),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406],
                         std=[0.229, 0.224, 0.225])
])
train_dataset = datasets.CIFAR10(root='./data', train=True,
                                 download=True, transform=transform)
#to describe train
train_dataset
train_loader = DataLoader(train_dataset, batch_size=64, shuffle=True)
Output:
Downloading https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz to ./data/cifar-10-python.tar.gz
100%|██████████| 170498071/170498071 [00:03<00:00, 55893335.47it/s]
Extracting ./data/cifar-10-python.tar.gz to ./data
Let's see the processing done in the above code,
Processing Transformations
- transforms.RandomResizedCrop(224): This transformation randomly crops the images to a size of 224x224 pixels. It first randomly scales the image and then crops it. This is commonly used for data augmentation and to ensure that the input size is consistent for models expecting specific input dimensions, such as many pretrained models.
- transforms.RandomHorizontalFlip(): With a default probability of 0.5, this transformation randomly flips the images horizontally. This is another form of data augmentation that helps in generalizing the model by introducing variations in the training data.
- transforms.ToTensor(): Converts the input image, which is a PIL Image or a NumPy ndarray, into a PyTorch tensor. It also scales the image's pixel intensity values from the range [0, 255] to [0, 1].
- transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]): Normalizes the tensor image with the provided mean and standard deviation for each channel (RGB). This particular mean and std are often used as they are the normalization parameters from the ImageNet dataset, which help in stabilizing the inputs to a network. Normalization is crucial for accelerating the training process and improving the performance of the model.
- Load the CIFAR-10 Dataset: The CIFAR-10 dataset is loaded using datasets.CIFAR10. This dataset comprises 50,000 training images and 10,000 test images, divided into 10 classes. The dataset is downloaded (download=True) and stored in the ./data directory. The transform parameter applies the defined transformations to the data.
- DataLoader: DataLoader is used to wrap the train_dataset, enabling efficient data loading for the training process. It provides functionalities like batching, shuffling, and parallel data loading.
PyTorch Dataset class for Customizing data transformations
The Dataset class in PyTorch plays a pivotal role in data handling and preprocessing, serving as a foundational building block for loading and organizing data in a way that is efficient and scalable for training deep learning models. Customizing data transformations within a Dataset class allows for flexible and dynamic data preprocessing, tailored specifically to the needs of a given model .
Role of PyTorch Dataset Class
By implementing two essential methods, __len__ (to return the size of the dataset) and __getitem__ (to support the indexing such that dataset[i] can be used to get the ith sample), a custom Dataset can be created for virtually any data source. Then Dataset instances can be seamlessly used with a DataLoader, which can provide batch loading of data, optional shuffling, and parallel data loading using multiprocessing workers, thereby simplifying the data feeding process into the model.
Customizing these within the Dataset class involves Transformations:
Transformations are operations applied to your data before it's fed into your model. Common transformations include:
- Resizing: Adjusting the dimensions of your data (e.g., images) to a fixed size required by your model.
- Normalization: Scaling your data to have a specific mean and standard deviation, often necessary for models to learn effectively.
- Augmentation: Techniques such as flipping, rotation, and color jittering that artificially expand your dataset by creating modified versions of the data, helping improve model robustness.
transforms.Compose takes a list of transformations and combines them into a single operation. This composite transformation can then be passed to your Dataset class and applied within the __getitem__ method. The ability to compose transformations makes your data preprocessing pipeline both more manageable and modular, as you can easily adjust or extend the sequence of transformations as needed.
You can infer more from the colab notebook provided in the conclusion.
Utilizing collate function for batch-level processing
Collate function helps to customize how individual samples are combined into batches within a DataLoader. It is useful when dealing with variable-sized input data or addition processing is required at the batch level.
from torch.utils.data import Dataset, DataLoader
from torch.nn.utils.rnn import pad_sequence
import torch
class CustomDataset(Dataset):
    def __init__(self, data):
        self.data = data
    def __len__(self):
        return len(self.data)
    def __getitem__(self, idx):
        return self.data[idx]
def custom_collate(batch):
    # Separate the input features and labels
    inputs = [item[0] for item in batch]
    labels = [item[1] for item in batch]
    # Pad sequences to the same length (if input features are sequences)
    inputs_padded = pad_sequence(inputs, batch_first=True, padding_value=0)
    return inputs_padded, torch.tensor(labels)
# Example usage
data = [(torch.tensor([1, 2, 3]), 0),
        (torch.tensor([4, 5]), 1),
        (torch.tensor([6, 7, 8, 9]), 0)]
custom_dataset = CustomDataset(data)
data_loader = DataLoader(custom_dataset, batch_size=2, collate_fn=custom_collate)
# Iterate over batches
for batch_inputs, batch_labels in data_loader:
    print("Batch Inputs:", batch_inputs)
    print("Batch Labels:", batch_labels)
Output:
Batch Inputs: tensor([[1, 2, 3],
[4, 5, 0]])
Batch Labels: tensor([0, 1])
Batch Inputs: tensor([[6, 7, 8, 9]])
Batch Labels: tensor([0])
Using multiple worker threads for data loading
DataLoader class allows you to specify the number of worker threads using the num_workers parameter. It can speed up data loading by allowing multiple samples to be loaded concurrently .This parameter determines how many subprocesses to use for data loading, which can significantly speed up the loading process, especially if loading data involves heavy I/O operations like reading from disk or fetching data from the network.
data_loader = DataLoader(dataset, batch_size=32, shuffle=True, num_workers=4)
We can adjust the num_workers parameter based on your hardware capabilities and the specific requirements of your dataset to achieve optimal performance. Also by using profiling tools like torch.utils.bottleneck to identify potential bottlenecks in your data loading pipeline and optimize accordingly.
Conclusion
DataLoader significantly impacts training quality. Batching, shuffling, and preprocessing are essential to a robust model and efficient for deep learning pipeline.
