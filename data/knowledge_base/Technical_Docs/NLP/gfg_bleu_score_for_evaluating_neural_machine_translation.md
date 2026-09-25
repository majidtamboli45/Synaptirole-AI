# BLEU Score for Evaluating Neural Machine Translation

> Source: https://www.geeksforgeeks.org/nlp/nlp-bleu-score-for-evaluating-neural-machine-translation-python/

Neural Machine Translation (NMT) is a standard task in NLP that involves translating a text from a source language to a target language. BLEU (Bilingual Evaluation Understudy) is a score used to evaluate the translations performed by a machine translator. In this article, we'll see the mathematics behind the BLEU score and its implementation in Python.
Table of Content
What is BLEU Score?
As stated above BLEU Score is an evaluation metric for Machine Translation tasks. It is calculated by comparing the n-grams of machine-translated sentences to the n-gram of human-translated sentences. Usually, it has been observed that the BLEU score decreases as the sentence length increases. This, however, might vary depending upon the model used for translation. The following is a graph depicting the variation of the BLEU Score with the sentence length.
Mathematical Expression for BLEU Score
Mathematically, BLEU Score is given as follows:
BLEU Score = BP * exp(\sum_{i=1}^{N}(w_i * ln(p_i)) Here,
- BP stands for Brevity Penalty
w_i is the weight for n-gram precision of order i (typically weights are equal for all i)
p_i is the n-gram modified precision score of order i.- N is the maximum n-gram order to consider (usually up to 4)
Modified n-gram precision (p_i )
The modified precision 
p_i = \frac{\text{Count Clip}(matches_i, \text{max-ref-count}_i)}{\text{candidate-n-grams}_i} Here,
- Count Clips is a function that clips the number of matched n-grams (
matches_i )by the maximum count of the n-gram across all reference translations (\text{max-ref-count}_i .
matches_i is the number of n-grams of order i that match exactly between the candidate translation and any of the reference translations.
\text{max-ref-count}_i is the maximum number of occurrences of the specific n-gram of order i found in any single reference translation.
\text{candidate-n-grams}_i is the total number of n-grams of order i present in the candidate translation.
Brevity Penalty (BP)
Brevity Penalty penalizes translations that are shorter than the reference translations. The mathematical expression for Brevity Penalty is given as follows:
BP = \exp(1- \frac{r}{c}) Here,
- r is the length of the candidate translation
- c is the average length of the reference translations.
How to Compute BLEU Score?
For a better understanding of the calculation of the BLEU Score, let us take an example. Following is a case for French to English Translation:
- Source Text (French): cette image est cliqué par moi
- Machine Translated Text: the picture the picture by me
- Reference Text-1: this picture is clicked by me
- Reference Text-2: the picture was clicked by me
We can clearly see that the translation done by the machine is not accurate. Let's calculate the BLEU score for the translation.
Unigram Modified Precision
For n = 1, we'll calculate the Unigram Modified Precision:
| Unigram | Count in Machine Translation | Max count in Ref | Clipped Count = min (Count in MT, Max Count in Ref) | 
|---|---|---|---|
| the | 2 | 1 | 1 | 
| picture | 2 | 1 | 1 | 
| by | 1 | 1 | 1 | 
| me | 1 | 1 | 1 | 
Here the unigrams (the, picture, by, me) are taken from the machine-translated text. Count refers to the frequency of n-grams in all the Machine Translated Text, and Clipped Count refers to the frequency of unigram in the reference texts collectively.
Bigram Modified Precision
For n = 2, we'll calculate the Bigram Modified Precision:
| Bigrams | Count in MT | Max Count in Ref | Clipped Count = min (Count in MT, Max Count in Ref) | 
|---|---|---|---|
| the picture | 2 | 1 | 1 | 
| picture the | 1 | 0 | 0 | 
| picture by | 1 | 0 | 0 | 
| by me | 1 | 1 | 1 | 
Trigram Modified Precision
For n = 3, we'll calculate the Trigram Modified Precision:
| Trigram | Count in MT | Max Count in Ref | Clipped Count = min (Count in MT, Max Count in Ref) | 
|---|---|---|---|
| the picture the | 1 | 0 | 0 | 
| picture the picture | 1 | 0 | 0 | 
| the picture by | 1 | 0 | 0 | 
| picture by me | 1 | 0 | 0 | 
4-gram Modified Precision
For n =4, we'll calculate the 4-gram Modified Precision:
| 4-gram | Count | Max Count in Ref | Clipped Count = min (Count in MT, Max Count in Ref) | 
|---|---|---|---|
| the picture the picture | 1 | 0 | 0 | 
| picture the picture by | 1 | 0 | 0 | 
| the picture by me | 1 | 0 | 0 | 
Computing Brevity Penalty
Now we have computed all the precision scores, let's find the Brevity Penalty for the translation:
- Machine Translation Output Length = 6 (Machine Translated Text: the picture the picture by me)
- Max Reference Output Length = 6 (Reference Text-2: the picture was clicked by me)
Computing BLEU Score
Finally, the BLEU score for the above translation is given by:
On substituting the values, we get,
Finally, we have calculated the BLEU score for the given translation.
BLEU Score Implementation in Python
Having calculated the BLEU Score manually, one is by now accustomed to the mathematical working of the BLEU score. However, Python's NLTK provides an in-built module for BLEU score calculation. Let's calculate the BLEU score for the same translation example as above but this time using NLTK.
Code:
from nltk.translate.bleu_score import sentence_bleu
# Define your desired weights (example: higher weight for bi-grams)
weights = (0.25, 0.25, 0, 0)  # Weights for uni-gram, bi-gram, tri-gram, and 4-gram
# Reference and predicted texts (same as before)
reference = [["the", "picture", "is", "clicked", "by", "me"],
             ["this", "picture", "was", "clicked", "by", "me"]]
predictions = ["the", "picture", "the", "picture", "by", "me"]
# Calculate BLEU score with weights
score = sentence_bleu(reference, predictions, weights=weights)
print(score)
Output:
0.7186082239261684
We can see that the BLEU score computed using Python is the same as the one computed manually. Thus, we have successfully calculated the BLEU score and understood the mathematics behind it.
