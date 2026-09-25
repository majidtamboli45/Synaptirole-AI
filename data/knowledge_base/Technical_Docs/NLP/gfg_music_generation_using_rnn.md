# Music Generation Using RNN

> Source: https://www.geeksforgeeks.org/nlp/music-generation-using-rnn/

Most of us love to hear music and sing music. Its creation involves a blend of creativity, structure, and emotional depth. The fusion of music and technology led to advancements in generating musical compositions using artificial intelligence which can lead to outstanding creativity. One of the significant contributors to this domain is the Recurrent Neural Network (RNN). It is a type of neural network designed to work with sequential data which has found remarkable applications in music generation. Its ability to comprehend and learn patterns from sequential data makes it an ideal candidate for composing music because music itself is fundamentally a sequence of notes, chords, and rhythms. In this article we will delve into the innovative use of Recurrent Neural Networks for music generation which will allow us to explore the foundational concepts behind RNNs, focusing on their unique abilities in understanding temporal dependencies within data.
Key-concepts of RNN
RNNs have several key concepts which are listed below:
- Sequential Learning: RNNs are tailored to process sequential data. They possess a memory element that enables them to retain information about previous inputs which makes them adept at capturing temporal dependencies. This characteristic is pivotal in understanding the sequential nature of musical compositions where the current note or chord often depends on the preceding musical context.
- Long Short-Term Memory (LSTM): A specialized variant of RNNs, LSTMs address the vanishing or exploding gradient problem encountered in traditional RNNs. LSTMs contain memory cells that store and regulate the flow of information which allows the network to retain crucial data over longer sequences. This is invaluable in music generation where maintaining coherence over extended musical passages is essential.
- Data Encoding and Generation: In the context of music generation, the input data—musical notes, chords, or even encoded representations of musical structure—is fed into the RNN. The network learns the patterns and correlations in the data, enabling it to generate new sequences or 'compose' music. The generation process involves feeding an initial seed sequence to the trained model and iteratively predicting subsequent notes or chords, resulting in a newly generated musical piece.
- Model Training: Training an RNN for music generation involves careful selection of hyperparameters such as sequence length, batch size and learning rate. The model is trained on a dataset of MIDI files or encoded musical data, learning the patterns and structure present in the music.
Implementation of Music Generation Using RNN
Installing required modules
At first we need to install all required Python modules required for this implementation.
!pip install pretty_midi
!sudo apt install -y fluidsynth
!pip install --upgrade pyfluidsynth
Importing required libraries
Now we will import all required Python libraries like NumPy, Pandas, Seaborn, TensorFlow, PrettyMIDI etc.
import numpy as np
import tensorflow as tf
import pandas as pd
import collections
import fluidsynth
import glob
import pretty_midi
from IPython import display
from typing import Dict, List, Optional, Sequence, Tuple
Dataset loading
For music generation it is required to choose a dataset which contains midi(.mid) files. One such dataset is here. You can manually download it and then upload it to the runtime. After that we need to correctly extract the dataset to perform further tasks.
!mkdir music-midi-dataset    # create a directory to extract the dataset
!unzip archive(7).zip  # replace the zip file name as per your file name
Driver functions
As music generation is a complex task so it requires various driver function which will play crucial role in music generation before model training. Basically we need to prepare the dataset to feed it to the RNN model.
- Display function: This is a function which is required to display the audio to the console. It is very small function to generate waveform followed by which type of playing instruments are there in the midi files.
sampling_rate = 44100
def display_audio(pm, seconds=30):
	waveform = pm.fluidsynth(fs=sampling_rate)
  # Take a sample of the generated waveform to mitigate kernel resets
	waveform_short = waveform[:seconds*sampling_rate]
	return display.Audio(waveform_short, rate=sampling_rate)
pm = pretty_midi.PrettyMIDI()
# Create an instrument instance and add it to the PrettyMIDI object
instrument = pretty_midi.Instrument(program=0, is_drum=False, name='acoustic grand piano') 
pm.instruments.append(instrument)
print(pm.instruments)
instrument = pm.instruments[0]
# This code is modified by Susobhan Akhuli
Output:
[Instrument(program=0, is_drum=False, name="acoustic grand piano")]
Function for midi to node generation(midi_to_notes): Music is fully depends on different notes. So, we need a function which can extract the note present in the midi files.
def midi_to_notes(midi_file):
	pm = pretty_midi.PrettyMIDI(midi_file)
	instrument = pm.instruments[0]
	notes = collections.defaultdict(list)
	sorted_notes = sorted(instrument.notes , key=lambda note:note.start)
	prev_start = sorted_notes[0].start
	for note in sorted_notes:
		start = note.start
		end = note.end
		notes["pitch"].append(note.pitch)
		notes["start"].append(start)
		notes["end"].append(end)
		notes["step"].append(start - prev_start)
		notes["duration"].append(end - start)
		prev_start = start
	return pd.DataFrame({name:np.array(value) for name,value in notes.items()})
raw_notes = midi_to_notes('x (43).mid')
note_names = np.vectorize(pretty_midi.note_number_to_name)
sample_note_names = note_names(raw_notes["pitch"])
# This code is modified by Susobhan Akhuli
This code defines the function midi_to_notes, which uses the PrettyMIDI library to extract pertinent information about the notes in a MIDI file. This data is arranged by the function into a pandas DataFrame with columns for duration, pitch, start and end times, and time steps from the preceding note (step).
Afterwards, the function is used on a sample MIDI file (sample_file), and the resulting DataFrame is processed using PrettyMIDI's note_number_to_name function—which maps MIDI note numbers to corresponding note names—to generate an array of note names. The note names that correspond to the pitches in the MIDI file are contained in the sample_note_names array
Generating midi file after training(notes_to_midi): Now we will define a function to convert this notes midi files which will be used after model training to generate the music.
def notes_to_midi(
  notes: pd.DataFrame,
  out_file: str,
  instrument_name: str,
  velocity: int = 100,  # note loudness
) -> pretty_midi.PrettyMIDI:
  pm = pretty_midi.PrettyMIDI()
  instrument = pretty_midi.Instrument(
      program=pretty_midi.instrument_name_to_program(
          instrument_name))
  prev_start = 0
  for i, note in notes.iterrows():
    start = float(prev_start + note['step'])
    end = float(start + note['duration'])
    note = pretty_midi.Note(
        velocity=velocity,
        pitch=int(note['pitch']),
        start=start,
        end=end,
    )
    instrument.notes.append(note)
    prev_start = start
  pm.instruments.append(instrument)
  pm.write(out_file)
  return pm
Extracted notes for music generation
Now let's see the extracted notes present in our dataset by calling midi_to_notes function.
num_files = 5
all_notes = []
filenames = glob.glob('*.mid') # Get a list of all MIDI files in the current directory
for f in filenames[:num_files] :
	notes = midi_to_notes(f)
	all_notes.append(notes)
all_notes = pd.concat(all_notes)
print(all_notes)
key_order = ["pitch" , "step" , "duration"]
train_notes = np.stack([all_notes[key] for key in key_order] , axis = 1)
notes_ds=tf.data.Dataset.from_tensor_slices(train_notes)
notes_ds.element_spec
# This code is modified by Susobhan Akhuli
Output:
  pitch   start      end   step  duration
0 66 0.000 0.2500 0.000 0.2500
1 66 0.500 0.6250 0.500 0.1250
2 64 0.625 0.7500 0.125 0.1250
3 66 0.750 0.8750 0.125 0.1250
4 66 1.000 1.2500 0.250 0.2500
.. ... ... ... ... ...
244 69 77.750 77.9375 0.125 0.1875
245 62 78.000 78.1875 0.250 0.1875
246 61 78.500 78.6250 0.500 0.1250
247 61 78.750 78.8750 0.250 0.1250
248 59 79.000 79.1250 0.250 0.1250
[249 rows x 5 columns]
TensorSpec(shape=(3,), dtype=tf.float64, name=None)
The input for the notes_to_midi function is a DataFrame containing musical notes (notes), an instrument name, an output MIDI file name (out_file), and an optional velocity parameter. To build a MIDI file, it makes use of the PrettyMIDI library. It starts by initializing a PrettyMIDI object, then iterates through the rows of the notes DataFrame to create an instrument with the given name and program. It calculates the start and finish times, builds a PrettyMIDI Note object with the timing, pitch, and velocity of each note, and appends it to the instrument. After that, the function returns the PrettyMIDI object and writes the MIDI file.
With the help of this function, a DataFrame containing musical notes can be transformed into a MIDI file with the desired instrument and timing information.
Creating music sequences
After notes, music relies on sequences and these are also required for model training. Here we will create a function to create sequences which defines the pitch, step and duration in the time of music generation.
seq_length = 20
vocab_size = 128
def create_sequences(dataset,seq_length,vocab_size=128):
    sequences = []
    targets = []
    num_seq = train_notes.shape[0] - seq_length
    for i in range(num_seq):
        sequence = train_notes[i:i+seq_length - 1,:] / [vocab_size, 1 ,1]
        target =  train_notes[i+seq_length] / vocab_size
        sequences.append(sequence)
        targets.append(target)
    sequences = np.array(sequences)
    targets = np.array(targets)
    print(sequences.shape , targets.shape)
    dataset = tf.data.Dataset.from_tensor_slices((sequences,{"pitch":targets[:,0] , "step":targets[:,1] ,"duration" :targets[:,2]}))
    return dataset
seq_ds = create_sequences(notes_ds, 21, vocab_size)
batch_size =64
buffer_size = 5000
train_ds = seq_ds.shuffle(buffer_size).batch(batch_size)
train_ds.element_spec
Output:
(228, 20, 3) (228, 3)
(TensorSpec(shape=(None, 20, 3), dtype=tf.float64, name=None),
{'pitch': TensorSpec(shape=(None,), dtype=tf.float64, name=None),
'step': TensorSpec(shape=(None,), dtype=tf.float64, name=None),
'duration': TensorSpec(shape=(None,), dtype=tf.float64, name=None)})
The function create_sequences is defined in this code, and its inputs are a dataset (dataset), a sequence length (seq_length), and a vocabulary size (vocab_size). It uses the train_notes tensor to generate sequences and matching targets. After normalizing the sequences by dividing them by the pitch dimension's vocabulary size, the targets and sequences are transformed into NumPy arrays.
After that, the function builds a TensorFlow dataset (dataset) using tf.data and outputs the shapes of the generated sequences and targets.From_tensor_slices dataset.
Lastly, the script batches the sequences and targets into groups of a defined batch size and shuffles them to form a training dataset (train_ds). The structure of train_ds's elements, which contain sequences and a dictionary of pitch, step, and duration targets, is displayed by printing the element_spec property of train_ds.
Defining Model
Now we will define a simple LSTM model to generate music.
layer = tf.keras.layers
learning_rate = 0.005
input_data = tf.keras.Input(shape=(seq_length , 3))
x= layer.LSTM(128)(input_data)
outputs = {
    "pitch":tf.keras.layers.Dense(64 , name = "pitch")(x),
    "step":tf.keras.layers.Dense(1 , name = "step")(x),
    "duration":tf.keras.layers.Dense(1 , name = "duration")(x),
}
model = tf.keras.Model(input_data , outputs)
loss  ={
    "pitch" : tf.keras.losses.SparseCategoricalCrossentropy(from_logits = True),
    "step": tf.keras.losses.MeanSquaredError(),
    "duration":tf.keras.losses.MeanSquaredError(),
}
optimizer = tf.keras.optimizers.Adam(learning_rate = learning_rate)
model.compile(loss=loss ,    loss_weights={
        'pitch': 0.05,
        'step': 1.0,
        'duration':1.0,
    }, optimizer = optimizer)
model.summary()
Output:
Model: "model_1"
__________________________________________________________________________________________________
Layer (type) Output Shape Param # Connected to
==================================================================================================
input_2 (InputLayer) [(None, 20, 3)] 0 []
lstm_1 (LSTM) (None, 128) 67584 ['input_2[0][0]']
duration (Dense) (None, 1) 129 ['lstm_1[0][0]']
pitch (Dense) (None, 64) 8256 ['lstm_1[0][0]']
step (Dense) (None, 1) 129 ['lstm_1[0][0]']
==================================================================================================
Total params: 76098 (297.26 KB)
Trainable params: 76098 (297.26 KB)
Non-trainable params: 0 (0.00 Byte)
__________________________________________________________________________________________________
A TensorFlow model for sequence generation is defined by this code. In order to process input sequences of shape (seq_length, 3), it employs an LSTM layer with 128 units. Pitch, step, and duration are the three values that the model produces. Dense layers with predetermined units make up the output layers. Different loss functions and corresponding loss weights are included in the model compilation for each output. MeanSquaredError is utilized for step and duration, and SparseCategoricalCrossentropy is used for pitch. A predetermined learning rate is applied while using the Adam optimizer.
Model.summary() provides information on the layers, their output shapes, and the overall number of parameters in the model. It also displays an overview of the model architecture.
Model fitting
Now we will fit the model on 10 epochs. You can change it as per your choice.
model.fit(train_ds , epochs = 10)
hist = model.predict(train_ds)
print(hist["duration"].shape)
Output:
Epoch 1/10
4/4 [==============================] - 3s 31ms/step - loss: 0.2344 - duration_loss: 0.0158 - pitch_loss: 4.0288 - step_loss: 0.0172
Epoch 2/10
4/4 [==============================] - 0s 28ms/step - loss: 0.1965 - duration_loss: 0.0041 - pitch_loss: 3.8111 - step_loss: 0.0018
Epoch 3/10
4/4 [==============================] - 0s 28ms/step - loss: 0.1655 - duration_loss: 0.0029 - pitch_loss: 3.2240 - step_loss: 0.0013
Epoch 4/10
4/4 [==============================] - 0s 31ms/step - loss: 0.0719 - duration_loss: 0.0290 - pitch_loss: 0.6562 - step_loss: 0.0102
Epoch 5/10
4/4 [==============================] - 0s 29ms/step - loss: 0.0412 - duration_loss: 0.0189 - pitch_loss: 0.0217 - step_loss: 0.0213
Epoch 6/10
4/4 [==============================] - 0s 29ms/step - loss: 0.0212 - duration_loss: 0.0089 - pitch_loss: 0.0101 - step_loss: 0.0118
Epoch 7/10
4/4 [==============================] - 0s 29ms/step - loss: 0.0133 - duration_loss: 0.0035 - pitch_loss: 0.0071 - step_loss: 0.0094
Epoch 8/10
4/4 [==============================] - 0s 27ms/step - loss: 0.0088 - duration_loss: 0.0013 - pitch_loss: 0.0057 - step_loss: 0.0073
Epoch 9/10
4/4 [==============================] - 0s 28ms/step - loss: 0.0059 - duration_loss: 6.9407e-04 - pitch_loss: 0.0050 - step_loss: 0.0050
Epoch 10/10
4/4 [==============================] - 0s 29ms/step - loss: 0.0040 - duration_loss: 5.7313e-04 - pitch_loss: 0.0045 - step_loss: 0.0032
<keras.src.callbacks.History at 0x7f43b9068d60>
4/4 [==============================] - 0s 12ms/step
(228, 1)
Using the training dataset (train_ds) for 10 epochs, the code first trains the model (model.fit(train_ds, epochs=10)). In order to minimize the designated loss functions, the model's parameters must be updated.
Following training, the code makes predictions on the same training dataset using the trained model (model.predict(train_ds)). Pitch, step, and duration predictions are shown in the ensuing hist. The shape of the expected duration values is printed by the line print(hist["duration"].shape), which also provides information about the predicted durations' dimensions.
Prediction of notes
Now we will define function which will predict the next node which is required to generate music.
def predict_next_note(
notes , keras_model , temperature):
    assert temperature > 0
    inputs = np.expand_dims(notes , 0)
    predictions = model.predict(inputs)
    pitch_logits = predictions['pitch']
    step = predictions["step"]
    duration = predictions["duration"]
    pitch_logits /= temperature
    pitch = tf.random.categorical(pitch_logits , num_samples = 1)
    pitch = tf.squeeze(pitch , axis = -1)
    duration = tf.squeeze(duration , axis =-1)
    step = tf.squeeze(step,axis = -1)
    step = tf.maximum(0,step)
    duration = tf.maximum(0 , duration)
    return int(pitch) , float(step) , float(duration)
  
temperature = 2.0
num_predictions = 1200
sample_notes = np.stack([raw_notes[key] for key in key_order], axis=1)
# The initial sequence of notes and the pitch is normalized similar to training sequences
input_notes = (
    sample_notes[:seq_length] / np.array([vocab_size, 1, 1]))
generated_notes = []
prev_start = 0
for _ in range(num_predictions):
      pitch, step, duration = predict_next_note(input_notes, model, temperature)
      start = prev_start + step
      end = start + duration
      input_note = (pitch, step, duration)
      generated_notes.append((*input_note, start, end))
      input_notes = np.delete(input_notes, 0, axis=0)
      input_notes = np.append(input_notes, np.expand_dims(input_note, 0), axis=0)
      prev_start = start
generated_notes = pd.DataFrame(
    generated_notes, columns=(*key_order, 'start', 'end'))
Output:
1/1 [==============================] - 0s 420ms/step
1/1 [==============================] - 0s 21ms/step
1/1 [==============================] - 0s 21ms/step
1/1 [==============================] - 0s 22ms/step
1/1 [==============================] - 0s 22ms/step
1/1 [==============================] - 0s 23ms/step
.......................
.......................
Three inputs are required for this function, predict_next_note: a sequence of notes, a Keras model (keras_model), and a temperature parameter. The next note is produced by taking the given temperature into consideration and selecting a sample from the pitch, step, and duration predictions made by the model. Pitch is randomly chosen using a categorical distribution, and the pitch logits are divided by the temperature. The projected pitch, step, and duration are returned by the function.
Music Generation
Now finally we are ready to generate music. We will call the 'notes_to_midi' to generate it and 'display_audio' to show it in console.
out_file = 'gfgmusicgnerate.mid'
instrument_name= pretty_midi.program_to_instrument_name(instrument.program)
out_pm = notes_to_midi(
    generated_notes, out_file=out_file, instrument_name=instrument_name)
display_audio(out_pm , 500)
Output:
Get the Complete Notebook:
Notebook: click here.
Dataset: click here.
