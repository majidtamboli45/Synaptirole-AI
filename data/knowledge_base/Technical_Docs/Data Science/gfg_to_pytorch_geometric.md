# Introduction to PyTorch Geometric

> Source: https://www.geeksforgeeks.org/data-science/introduction-to-pytorch-geometric/

PyTorch Geometric (PyG) is a popular extension library for PyTorch that makes it easy to build and train Graph Neural Networks (GNNs). It provides efficient tools and data structures to work with graph structured data like social networks, molecules and knowledge graphs. PyG includes ready made GNN layers, dataset loaders and batching utilities all while integrating seamlessly with PyTorch’s familiar workflow.
How to Install PyTorch Geometric
Step 1: Make sure you have PyTorch installed
- This command installs the core PyTorch library along with TorchVision for computer vision utilities and datasets and TorchAudio for audio processing.
- This sets up the basic PyTorch ecosystem needed to build and run deep learning models.
pip install torch torchvision torchaudio
Step 2: Install PyTorch Geometric and its dependencies
- This command installs PyTorch Geometric along with its essential dependencies like torch-scatter, torch-sparse, torch-cluster and torch-spline-conv.
- These packages provide optimized operations needed for efficient graph processing in PyG.
pip install torch - scatter torch - sparse torch - cluster torch - spline - conv torch - geometric
Step 3: Check Installation
- This code imports the PyTorch Geometric library and prints its installed version.
- It’s a quick way to verify that PyG is installed correctly and to check which version you’re using.
import torch_geometric
print(torch_geometric.__version__)
Output:
2.3.0
Basic Functions and Features
Some Basic Funtions of PyTorch Geometric are listed below:
1. Graph Neural Network (GNN) Layers: PyG comes with a wide range of GNN models and layers such as:
- GCNConv (Graph Convolutional Network)
- GATConv (Graph Attention Network)
- SAGEConv (GraphSAGE)
- GINConv (Graph Isomorphism Network)
These layers help capture local structure and information flow within graph nodes and edges.
For Example:
- This code creates a tiny graph with 3 nodes and their features plus edges connecting them.
- It defines a simple Graph Convolutional Network (GCN) with one layer that transforms node features from 2 to 4 dimensions.
- Finally it runs the model on the graph data and prints the updated node features after applying the GCN layer and activation.
import torch
import torch.nn.functional as F
from torch_geometric.nn import GCNConv
from torch_geometric.data import Data
x = torch.tensor([[1, 2], [3, 4], [5, 6]], dtype=torch.float)
edge_index = torch.tensor([[0, 1, 2, 0],  
                           [1, 0, 1, 2]], dtype=torch.long)  
data = Data(x=x, edge_index=edge_index)
class SimpleGCN(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.conv1 = GCNConv(2, 4) 
    def forward(self, data):
        x, edge_index = data.x, data.edge_index
        x = self.conv1(x, edge_index)
        return F.relu(x)
model = SimpleGCN()
out = model(data)
print("Output node features after GCN layer:\n", out)
Output:
2. Data Representation: Graphs in PyG are represented using the Data object which stores:
- Node features: x
- Edge index: edge_index
- Edge features: edge_attr
- Labels or targets: y
You can also create batches of graphs using the Batch object for training with minibatches.
3. Dataset Utilities: PyG provides many ready to use benchmark datasets:
- Citation networks like Cora, CiteSeer
- Social networks like Reddit
- Molecule datasets like QM9 and ZINC
These datasets can be loaded with a single line of code using torch_geometric.datasets.
4. Fast and Scalable: PyG is built with CUDA support and sparse tensor optimizations. This means you can work with large graphs efficiently using GPUs. It also includes neighbor sampling and mini batching important for scaling GNNs to large scale graphs like Twitter or Facebook graphs.
5. Integration with PyTorch: As it's a PyTorch extension, PyG seamlessly fits into standard PyTorch training loops. You can use standard optimizers, loss functions and autograd functionality.
Applications
- Social Networks: Analyze social graphs to detect communities, recommend friends or predict user behavior. GNNs can capture complex relationships between users improving personalized suggestions and trend analysis.
- Knowledge Graphs: Perform link prediction to find missing relations or classify entities within large knowledge bases. This helps in enhancing search engines, question answering systems and semantic reasoning.
- Molecule and Chemistry: Predict molecular properties for drug discovery and materials science. Atoms are represented as nodes and chemical bonds as edges enabling models to learn chemical interactions effectively.
- Recommender Systems: Model user item interactions as bipartite graphs to improve recommendation quality. GNNs can learn from both users’ preferences and item similarities for better personalized suggestions.
