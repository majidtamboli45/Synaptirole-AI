# Pair Encoding (BPE) in NLP

> Source: https://www.geeksforgeeks.org/nlp/byte-pair-encoding-bpe-in-nlp/

Byte-Pair Encoding (BPE) is a text tokenization technique in Natural Language Processing. It breaks down words into smaller, meaningful pieces called subwords. It works by repeatedly finding the most common pairs of characters in the text and combining them into a new subword until the vocabulary reaches a desired size. This technique helps in handling rare or unknown words by breaking them into smaller parts that the model has already learned during training. By reducing the vocabulary size, it makes it easier to work with large amounts of text while allowing the model to understand wide variety of languages.
Concepts related to BPE
To understand BPE better, it’s important to know its key concepts:
- Vocabulary: In BPE vocabulary refers to the set of subword units (tokens) used to represent all the words in the corpus. After applying BPE, vocabulary consists of all the subwords that can be used to represent a word in the dataset.
- Byte: It is a basic unit of digital information that consists of 8 bits. It is used to represent characters that are encoded as bytes that will be merged.
- Character: It is a single letter, number or punctuation mark in text. We start by treating each word as a sequence of characters and merging process creates subword units based on character pairs.
- Frequency: It refers to how many times a particular byte or character appears in the corpus. BPE is driven by the frequency of character pairs meaning that the most frequent pair of characters will be merged first.
- Merge: It is the process of combining two consecutive characters or subword units into a new unit. Each merge reduces the total number of tokens in the corpus and leads to more abstract representations of words.
How Byte-Pair Encoding (BPE) works?
Suppose we have a text corpus with the following four words: "ab", "bc", "bcd" and "cde". We begin by calculating the frequencies of each byte (character). Initial vocabulary consists of all the unique characters in the corpus like {"a", "b", "c", "d", "e"}.
Step 1: Initialize the vocabulary
Vocabulary = {"a", "b", "c", "d", "e"}
Step 2: Calculate the frequency of each byte or character in the text corpus:
Frequency = {"a": 1, "b": 3, "c": 3, "d": 2, "e": 1}
- "b" appears 3 times.
- "c" appears 3 times.
- "d" appears 2 times.
- "a" and "e" appear once.
Step 3: Find the most frequent pair of two characters
Most frequent pair is "bc" with a frequency of 2.
Step 4: Merge the pair to create a new subword unit.
Merge "bc" to create a new subword unit "bc".
Step 5: Update frequency counts of all the bytes or characters that contain the merged pair.
Update the frequency counts of all the bytes or characters that contain "bc":
Frequency = {"a": 1, "b": 1, "c": 1, "d": 2, "e": 1, "bc": 2}
- "b"'s frequency decreases to 1 because the pair "bc" now represents both "b" and "c" together.
- Similarly, "c"'s frequency drops to 1 as well.
Step 6: Add the new subword unit to the vocabulary
Add "bc" to the vocabulary:
Vocabulary = {"a", "b", "c", "d", "e", "bc"}
Repeat steps 3-6 until the desired vocabulary size is reached.
Step 7: Represent the text corpus using subword units
Resulting vocabulary consists of the following subword units: {"a", "b", "c", "d", "e", "bc", "cd", "de","ab","bcd","cde"}.
Original text corpus can be represented using these subword units as follows:
"ab" -> "a" + "b"
"bc" -> "bc"
"bcd" -> "bc" + "d"
"cde" -> "c" + "de"
This representation helps in reducing the vocabulary size while maintaining the original meaning and structure of the text.
Implementation of Byte-Pair Encoding (BPE) in Python:
1. Importing Libraries
We will be using defaultdict from collections to easily manage the frequency of character pairs and subword units. This is important for storing and updating vocabulary during the BPE process.
from collections import defaultdict
2. Initializing Vocabulary with Character Pairs
learn_bpe function is designed to learn and return the most frequent character pairs from the input text. It also merges these frequent pairs iteratively.
- Loop splits each word into characters and adds start (< ) and end (> ) markers to each word.
- defaultdict(int) to initialize frequency counts of words automatically to zero.
- pair refers to each consecutive character pair in the word.
- We count the occurrence of each pair in the vocab .
def learn_bpe(corpus, num_merges=3):
    vocab = defaultdict(int)
    
   
    for sentence in corpus.split('.'):
        words = sentence.strip().split()
        for word in words:
            chars = ['<'] + list(word) + ['>']  
            for i in range(len(chars) - 1):
                pair = (chars[i], chars[i+1])
                vocab[pair] += 1
3. Finding the Most Frequent Pair and Merging
We iterate through the vocabulary to find the most frequent adjacent character pair and perform the merge.
Process repeats for a defined number of merges (num_merges).
- most_frequent = max(vocab, key=lambda x: vocab[x]) : Finds the pair with the highest frequency.
- We then store this pair in the merges list.
- We create a new vocabulary where we replace occurrences of the pair with a new merged character.
merges = []
    for _ in range(num_merges):
        if not vocab:
            break
        
        most_frequent = max(vocab, key=lambda x: vocab[x])
        merges.append(most_frequent)
       
        new_char = ''.join(most_frequent)
        new_vocab = defaultdict(int)
        for pair in vocab:
            count = vocab[pair]
            if pair == most_frequent:
                continue
            new_pair = list(pair)
            if new_pair[0] == most_frequent[0] and new_pair[1] == most_frequent[1]:
                new_pair[0] = new_char
                new_pair.pop(1)
            new_vocab[tuple(new_pair)] += count
        vocab = new_vocab
    return merges
4. Applying the Learned Merges
In the apply_bpe function, we take a word and apply the previously learned merges. We iterate over the list of merges in reverse order, merging the pairs in the text. For each merge we look for matching adjacent character pairs and replace them with the merged character.
def apply_bpe(text, merges):
    chars = ['<'] + list(text) + ['>']  
    for merge in reversed(merges):  
        merged = ''.join(merge)
        new_chars = []
        i = 0
        while i < len(chars) - 1:
            if (chars[i], chars[i+1]) == merge:  
                new_chars.append(merged)
                i += 2
            else:
                new_chars.append(chars[i])
                i += 1
        if i < len(chars):
            new_chars.append(chars[-1])
        chars = new_chars
    
    return chars
5. Example Usage
Finally we demonstrate the usage of the learn_bpe and apply_bpe functions with a sample corpus. We first learn the BPE merges from the corpus "ab bc bcd cde" and then apply the learned merges to the word "bcd".
# Example usage
corpus = "ab bc bcd cde"
merges = learn_bpe(corpus, num_merges=3) 
print("Learned Merges:", merges)
bpe_representation = apply_bpe("bcd", merges)
print("BPE Representation for 'bcd':", bpe_representation)
Output:
Learned Merges: [('<', 'b'), ('b', 'c'), ('c', 'd')] 
BPE Representation for 'bcd': ['<b', 'cd', '>']
Learned merges show the most common pairs of characters that were combined into new subwords. These pairs were merged during the training process to create subword units. When applying BPE to the word "bcd" learned merges split it into the subwords ['<b', 'cd', '>'].
You can download source code from here.
