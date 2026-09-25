# Text Summarization with Sumy

> Source: https://www.geeksforgeeks.org/nlp/mastering-text-summarization-with-sumy-a-python-library-overview/

Text summarization is the process of generating a concise version of a document while preserving its most important information. It is widely used to quickly understand large volumes of text such as news articles, research papers, reports, and legal documents.
- Sumy is a lightweight Python library for extractive text summarization that provides multiple algorithms, including Luhn, LSA, Edmundson, LexRank, and KL-Summarizer.
- It requires minimal setup, integrates well with NLP workflows, and allows users to choose the summarization technique that best suits their data.
Setting Up Sumy
Getting Sumy up and running is straightforward. We can install it through PyPI using pip:
pip install sumy
Text Preprocessing
Before summarization, the input text is preprocessed to improve the quality of the generated summary. Sumy provides built-in support for tokenization and stemming, which help prepare text for summarization algorithms.
1. Tokenization with Sumy
Tokenization splits text into smaller units such as sentences and words. It helps summarization algorithms process the document more effectively.
- Splits text into sentences and words.
- Handles punctuation automatically.
- Supports language-specific tokenization.
!pip install -q sumy
import nltk
nltk.download('punkt')
nltk.download('punkt_tab')
from sumy.nlp.tokenizers import Tokenizer
tokenizer = Tokenizer("english")
text = "Machine learning powers modern AI."
words = tokenizer.to_words(text)
print(words)
Output:
('Machine', 'learning', 'powers', 'modern', 'AI')
2. Stemming for Word Normalization
Stemming reduces words to their root form so that different variations of a word are treated as the same term during summarization.
- Converts words to their root forms.
- Groups similar word variations.
- Improves frequency-based summarization.
!pip install -q sumy
from sumy.nlp.stemmers import Stemmer
# Create stemmer
stemmer = Stemmer("english")
words = ["running", "coding", "algorithms"]
for word in words:
    print(f"{word} -> {stemmer(word)}")er.to_words(text)
print(words)
Output:
running -> run
coding -> code
algorithms -> algorithm
Summarization Algorithms in Sumy
Sumy provides several algorithms, each with different approaches to identifying important sentences. Let's explore the most effective ones.
1. Luhn Summarizer
The Luhn summarizer ranks sentences based on the frequency of significant words. It selects sentences containing important terms after filtering out stop words. Since it relies on word frequency, it is computationally efficient and suitable for summarizing medium-sized documents.
- Uses word frequency to rank sentences.
- Filters stop words before summarization.
- Suitable for quick extractive summaries.
- Time Complexity: O(n2), where n is the number of sentences.
- Space Complexity: O(n × m), where m is the vocabulary size.
from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.luhn import LuhnSummarizer
text = """
AI is transforming industries.
Machine learning learns from data.
AI improves healthcare.
"""
parser = PlaintextParser.from_string(text, Tokenizer("english"))
summary = LuhnSummarizer()(parser.document, 2)
for sentence in summary:
    print(sentence)
Output:
AI is transforming industries.
Machine learning learns from data.
2. Edmundson Summarizer
The Edmundson summarizer assigns custom importance to words using bonus, stigma, and null words. This makes it suitable for domain-specific summarization where certain keywords should receive higher priority. Additional word weighting introduces slightly more processing than frequency-based methods.
- Supports custom keyword weighting.
- Prioritizes domain-specific terms.
- Suitable for customized summaries.
- Time Complexity: O(n2) with additional overhead for custom word weighting.
- Space Complexity: O(n × m), where m is the vocabulary size.
from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.edmundson import EdmundsonSummarizer
from sumy.utils import get_stop_words
text = """
AI is transforming industries.
Machine learning learns from data.
AI improves healthcare.
"""
parser = PlaintextParser.from_string(text, Tokenizer("english"))
summarizer = EdmundsonSummarizer()
# Required word lists
summarizer.null_words = get_stop_words("english")
summarizer.bonus_words = ("ai", "learning")
summarizer.stigma_words = ("industries",)
summary = summarizer(parser.document, 2)
for sentence in summary:
    print(sentence)
Output:
AI is transforming industries.
AI improves healthcare.
3. LSA Summarizer
The LSA summarizer identifies important sentences by analyzing semantic relationships between words rather than relying only on word frequency. It generally produces more meaningful summaries but requires additional computation due to matrix decomposition.
- Uses latent semantic analysis.
- Captures relationships between words.
- Produces context-aware summaries.
- Time Complexity: O(n3) due to matrix decomposition.
- Space Complexity: O(n × m) with additional memory for matrix operations.
from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.lsa import LsaSummarizer
text = """
AI is transforming industries.
Machine learning learns from data.
AI improves healthcare.
"""
parser = PlaintextParser.from_string(text, Tokenizer("english"))
summary = LsaSummarizer()(parser.document, 2)
for sentence in summary:
    print(sentence)
Output:
AI is transforming industries.
Machine learning learns from data.
You can download the complete code from here.
Quick Difference:
| Feature | LSA Summarizer | Luhn Summarizer | Edmundson Summarizer | 
|---|---|---|---|
| Approach | Uses latent semantic analysis to identify important sentences. | Uses word frequency to rank important sentences. | Uses weighted keywords to rank sentences. | 
| Sentence Selection | Based on semantic relationships between words. | Based on the frequency of significant words. | Based on bonus, stigma, and null words. | 
| Customization | Limited customization options. | Does not support custom weighting. | Supports custom word weighting for summaries. | 
| Time Complexity | O(n³) due to matrix decomposition. | O(n²) based on sentence scoring. | O(n²) with additional keyword weighting. | 
| Best Use Case | Summarizing documents with rich semantic content. | Quickly summarizing structured or general text. | Summarizing domain-specific documents with important keywords. | 
Applications
- News Summarization: Generates concise summaries of lengthy news articles for faster reading.
- Research Papers: Creates brief summaries of academic papers to simplify literature review.
- Technical Documentation: Extracts key information from software manuals and technical documents.
- Legal Documents: Highlights important clauses from lengthy contracts and legal agreements.
- Content Management Systems: Produces article previews and summaries for websites and portals.
Advantages
- Easy to integrate with Python-based NLP applications.
- Requires minimal code to generate document summaries.
- Provides customizable summarization through different algorithms.
- Suitable for summarizing long textual documents efficiently.
Limitations
- Summary quality depends on the selected summarization algorithm.
- Less effective for very short documents with limited context.
- Domain-specific documents may require algorithm customization.
- Does not capture deep semantic understanding like transformer-based models.
