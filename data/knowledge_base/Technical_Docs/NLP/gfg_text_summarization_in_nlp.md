# Text Summarization in NLP

> Source: https://www.geeksforgeeks.org/nlp/text-summarization-in-nlp/

Automatic Text Summarization is a key technique in Natural Language Processing (NLP) that uses algorithms to reduce large texts while preserving essential information. Although it doesn’t receive as much attention as other machine learning breakthroughs, text summarization technology has seen continuous improvements. By extracting key concepts and maintaining the original meaning, these systems can revolutionize industries such as banking, law, and healthcare, enabling faster decision-making and information retrieval.
There are two primary types of text summarization techniques:
- Extractive Summarization
- Abstractive Summarization
Extractive Summarization
Extractive summarization algorithms automatically generate summaries by selecting and combining key passages from the original text. Unlike human summarizers, these models focus on extracting the most important sentences without creating new content. The goal is to preserve the meaning of the original text while condensing it.
The TextRank algorithm is widely used for extractive summarization tasks. By ranking sentences based on their relevance and importance, it can generate a concise summary. Let's explore how this algorithm works with a sample text.
Utilizing TextRank Algorithm for Extractive Text Summarization
TextRank is implemented in the spaCy library. With the help of PyTextRank, a spaCy extension, we can efficiently apply the TextRank algorithm to summarize text. While extractive summarization provides a modified version of the original text by retaining key phrases, it does not generate entirely new content.
Prerequisites:
- spaCy: A Python library for NLP tasks.
- PyTextRank: A spaCy extension that implements the TextRank algorithm.
To install spaCy and the required language model, run the following commands:
!pip install spacy
!python3 -m spacy download en_core_web_lg
To install PyTextRank, run:
!pip install pytextrank
Here’s a simple implementation of spaCy and PyTextRank for automatic text summarization. The code installs the required packages, downloads the spaCy language model, and processes a lengthy text to extract key phrases and sentences. The summary is limited to two key phrases and two sentences.
import spacy
import pytextrank
nlp = spacy.load("en_core_web_lg")
nlp.add_pipe("textrank")
example_text = """Deep learning (also known as deep structured learning) is part of a 
broader family of machine learning methods based on artificial neural networks with 
representation learning. Learning can be supervised, semi-supervised or unsupervised. 
Deep-learning architectures such as deep neural networks, deep belief networks, deep reinforcement learning, 
recurrent neural networks and convolutional neural networks have been applied to
fields including computer vision, speech recognition, natural language processing, 
machine translation, bioinformatics, drug design, medical image analysis, material
inspection and board game programs, where they have produced results comparable to 
and in some cases surpassing human expert performance. Artificial neural networks
(ANNs) were inspired by information processing and distributed communication nodes
in biological systems. ANNs have various differences from biological brains. Specifically, 
neural networks tend to be static and symbolic, while the biological brain of most living organisms
is dynamic (plastic) and analogue. The adjective "deep" in deep learning refers to the use of multiple
layers in the network. Early work showed that a linear perceptron cannot be a universal classifier, 
but that a network with a nonpolynomial activation function with one hidden layer of unbounded width can.
Deep learning is a modern variation which is concerned with an unbounded number of layers of bounded size, 
which permits practical application and optimized implementation, while retaining theoretical universality 
under mild conditions. In deep learning the layers are also permitted to be heterogeneous and to deviate widely 
from biologically informed connectionist models, for the sake of efficiency, trainability and understandability, 
whence the structured part."""
print('Original Document Size:',len(example_text))
doc = nlp(example_text)
for sent in doc._.textrank.summary(limit_phrases=2, limit_sentences=2):
    print(sent)
    print('Summary Length:',len(sent))
Output:
Original Document Size: 1808
Deep-learning architectures such as deep neural networks, deep belief networks, deep reinforcement learning, recurrent neural networks and convolutional neural networks have been applied to fields including computer vision, speech recognition, natural language processing, machine translation, bioinformatics, drug design, medical image analysis, material inspection and board game programs, where they have produced results comparable to and in some cases surpassing human expert performance.
Summary Length: 76
Specifically, neural networks tend to be static and symbolic, while the biological brain of most living organisms is dynamic (plastic) and analogue.
Summary Length: 27
Abstractive Summarization
Abstractive summarization generates entirely new sentences to convey key ideas from the original text. Unlike extractive summarization, which selects and rearranges sentences from the original content, abstractive methods rephrase information in a more concise and coherent manner, often using new vocabulary that wasn't present in the original.
Abstractive summarization has gained prominence with the advent of Transformer models, which have revolutionized NLP tasks. Initially, models based on recurrent neural networks (RNNs) were used for text summarization, but Transformers introduced a unique architecture that significantly improved performance.
Note: Not all Transformer models are designed for text summarization. One of the most notable models in this domain is PEGASUS, which has shown superior performance in generating high-quality summaries.
PEGASUS: A Transformer Model for Text Summarization
PEGASUS is a Transformer-based model designed specifically for text summarization. Unlike other models, PEGASUS uses a unique pre-training strategy where critical sentences are masked during training. The model is then tasked with generating these hidden sentences, which enables it to create more accurate and coherent summaries.
To use the PEGASUS model for text summarization, you need to install the following libraries and frameworks:
!pip install git+https://github.com/Lightning-AI/pytorch-lightning
!pip install git+https://github.com/huggingface/transformers
!pip install sentencepiece
!pip install git+https://github.com/stas00/transformers
!pip install pegasus
Once the dependencies are installed, you can begin summarizing text with the PEGASUS model. Below is an example code snippet that uses the Hugging Face Transformers library to load the model, tokenize the input text, generate a summary, and display it.
from transformers import pipeline
from transformers import PegasusForConditionalGeneration, PegasusTokenizer
# Pick model
model_name = "google/pegasus-xsum"
# Load pretrained tokenizer
pegasus_tokenizer = PegasusTokenizer.from_pretrained(model_name)
example_text = """
Deep learning (also known as deep structured learning) is part of a broader family of machine learning
methods based on artificial neural networks with representation learning. 
Learning can be supervised, semi-supervised or unsupervised. Deep-learning architectures such as 
deep neural networks, deep belief networks, deep reinforcement learning, 
recurrent neural networks and convolutional neural networks have been applied to 
fields including computer vision, speech recognition, natural language processing,
machine translation, bioinformatics, drug design, medical image analysis, 
material inspection and board game programs, where they have produced results 
comparable to and in some cases surpassing human expert performance. 
Artificial neural networks (ANNs) were inspired by information processing and 
distributed communication nodes in biological systems. ANNs have various differences 
from biological brains. Specifically, neural networks tend to be static and symbolic,
while the biological brain of most living organisms is dynamic (plastic) and analogue.
The adjective "deep" in deep learning refers to the use of multiple layers in the network.
Early work showed that a linear perceptron cannot be a universal classifier, 
but that a network with a nonpolynomial activation function with one hidden layer of 
unbounded width can. Deep learning is a modern variation which is concerned with an 
unbounded number of layers of bounded size, which permits practical application and 
optimized implementation, while retaining theoretical universality under mild conditions. 
In deep learning the layers are also permitted to be heterogeneous and to deviate widely 
from biologically informed connectionist models, for the sake of efficiency, trainability 
and understandability, whence the structured part."""
print('Original Document Size:',len(example_text))
# Define PEGASUS model
pegasus_model = PegasusForConditionalGeneration.from_pretrained(model_name)
# Create tokens
tokens = pegasus_tokenizer(example_text, truncation=True, padding="longest", return_tensors="pt")
# Generate the summary
encoded_summary = pegasus_model.generate(**tokens)
# Decode the summarized text
decoded_summary = pegasus_tokenizer.decode(encoded_summary[0], skip_special_tokens=True)
# Print the summary
print('Decoded Summary :',decoded_summary)
summarizer = pipeline(
    "summarization", 
    model=model_name, 
    tokenizer=pegasus_tokenizer, 
    framework="pt"
)
summary = summarizer(example_text, min_length=30, max_length=150)
summary[0]["summary_text"]
Output:
Original Document Size: 1825
Decoded Summary : Deep learning is a branch of computer science that deals with the study and training of machine learning.
'Deep learning is a branch of computer science which deals with the study and training of complex systems such as speech recognition, natural language processing, machine translation and medical image analysis. Deep-learning architectures such as deep neural networks, deep belief networks, deep reinforcement learning, recurrent neural networks and neuralal networks have been applied to fields including computer vision, speech recognition, natural language processing, machine translation, bioinformatics, drug design, medical image analysis, material inspection and board game programs, where they have produced results comparable to and in some cases surpassing human expert performance.'
Conclusion
The future of text summarization looks promising, with advancements in both extractive and abstractive methods, powered by models like PEGASUS. As these techniques evolve, they will enable more accurate and intuitive summarization, transforming how we process vast amounts of information. This progress highlights the growing potential of AI in enhancing human comprehension and knowledge management.
