# Introduction to Long Short Term Memory

> Source: https://www.geeksforgeeks.org/deep-learning/deep-learning-introduction-to-long-short-term-memory/

Long Short-Term Memory (LSTM) is an improved version of the Recurrent Neural Network (RNN) designed to capture long-term dependencies in sequential data. It uses a memory cell to store information over time, solving the limitations of traditional RNNs.
- Handles Long Term Dependencies: Remembers information for longer sequences
- Memory Cell: Stores and updates important information over time
- Better than RNN: Overcomes short term memory limitations
- Applications: Used in language translation, speech recognition and time series forecasting
Problem with Long-Term Dependencies in RNN
RNNs are designed to handle sequential data by using a hidden state that stores information from previous steps. However, they struggle to learn long-term dependencies. This happens due to:
- Vanishing Gradient: When training a model over time, the gradients which help the model learn can shrink as they pass through many steps. This makes it hard for the model to learn long-term patterns since earlier information becomes almost irrelevant.
- Exploding Gradient: Sometimes gradients can grow too large causing instability. This makes it difficult for the model to learn properly as the updates to the model become erratic and unpredictable.
LSTM Architecture
LSTM (Long Short-Term Memory) architecture is designed to learn long-term dependencies in sequential data using memory cells and gates that control the flow of information through the network.
Main Gates in LSTM
- Input Gate: Decides which new information should be added to the memory cell
- Forget Gate: Determines which information should be removed from the memory cell
- Output Gate: Controls which information from the memory cell is passed to the next hidden state and output
Working of LSTM
LSTM consists of a repeating chain like structure with memory cells and gating mechanisms
Information is retained by the cells and the memory manipulations are done by thegates. There are three gates:
1. Forget Gate
The forget gate decides which information should be kept or removed from the cell state. It uses the current input 
- Values close to 0 remove information
- Values close to 1 retain information
- Helps discard unnecessary past information
- Controls memory retention in the LSTM
The equation for the forget gate is:
f_t = \sigma \left( W_f \cdot [h_{t-1}, x_t] + b_f \right) 
Where
- W_f represents the weight matrix associated with the forget gate.
- [h_t-1, x_t] denotes the concatenation of the current input and the previous hidden state.
- b_f is the bias with the forget gate.
- \sigma is the sigmoid activation function.
2. Input gate
The addition of useful information to the cell state is done by the input gate.
- First the information is regulated using the sigmoid function and filter the values to be remembered similar to the forget gate using inputs h_{t-1} andx_t .
- Then, a vector is created using tanh function that gives an output from -1 to +1 which contains all the possible values from h_{t-1} andx_t .
- At last the values of the vector and the regulated values are multiplied to obtain the useful information.
The equation for the input gate is:
i_t = \sigma \left( W_i \cdot [h_{t-1}, x_t] + b_i \right) \hat{C}_t = \tanh \left( W_c \cdot [h_{t-1}, x_t] + b_c \right) 
We multiply the previous state by 
C_t = f_t \odot C_{t-1} + i_t \odot \hat{C}_t 
where
- \odot denotes element-wise multiplication
- tanh is activation function
3. Output gate
The output gate determines which information from the current cell state should be passed as the hidden state (output) at the current time step. It uses the previous hidden state 
o_t = \sigma \left( W_o \cdot [h_{t-1}, x_t] + b_o \right) 
Next, the current cell state 
h_t = o_t \odot \tanh(C_t) 
Here:
- o_t  is the output gate activation.
- C_t  is the current cell state.
- \odot represents element-wise multiplication.
- \sigma is the sigmoid activation function.
This hidden state 
Applications
- Language modeling for machine translation and text summarization
- Speech recognition for converting audio into text
- Time series forecasting for stock prices, weather and energy usage
- Anomaly detection for fraud and intrusion detection
- Recommender systems for personalized suggestions
- Video analysis for activity recognition and motion understanding
