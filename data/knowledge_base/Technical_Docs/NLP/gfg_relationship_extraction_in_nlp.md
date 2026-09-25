# Relationship Extraction in NLP

> Source: https://www.geeksforgeeks.org/nlp/relationship-extraction-in-nlp/

Relationship Extraction (RE) is a Natural Language Processing (NLP) technique used to identify and extract semantic relationships between entities mentioned in textual data. It converts unstructured text into structured information by identifying how different entities are connected.
- Identifies relationships between entities such as people, organizations, locations, and dates.
- Works with Named Entity Recognition (NER) to identify entities before extracting relationships.
- Supports applications such as knowledge graphs, question answering, information retrieval, and recommendation systems.
Working
The above example illustrates the complete workflow of Relationship Extraction using the sentence "Steve Jobs was born in San Francisco on 24 Feb 1955."
Step 1: Input Sentence: The process begins with an input sentence containing multiple entities and the relationships between them.
Step 2: Entity Recognition (NER): The system identifies the named entities present in the sentence:
- Steve Jobs → Person
- San Francisco → Location
- 24 Feb 1955 → Date
Step 3: Relationship Extraction: After identifying the entities, the system determines how they are related. In this example, two relationships are extracted:
- Steve Jobs → Born in → San Francisco
- Steve Jobs → Born on → 24 Feb 1955
Components
- Entity: An entity is a person, organization, location, date, product, or any other object mentioned in the text that participates in a relationship.
- Entity Pair: An entity pair refers to the two entities between which a relationship is identified.
- Relation: A relation describes how two entities are semantically connected within a sentence.
- Context: Context refers to the surrounding words or sentence structure that help determine the correct relationship between entities.
- Relation Type: Relation type represents the category of the extracted relationship.
Types
Relationship Extraction can be classified into different types based on how relationships are identified and represented.
1. Binary Relationship Extraction
Binary Relationship Extraction identifies the relationship between two entities in a sentence. It focuses on extracting a single relation connecting one entity to another.
Example:
"Steve Jobs founded Apple."
Extracted Relationship: (Steve Jobs, Founded, Apple)
2. Multi-Class Relationship Extraction
Multi-Class Relationship Extraction classifies the relationship between entities into one of several predefined categories, such as Founded, Works For, Located In, or Born In.
Example:
"Satya Nadella is the CEO of Microsoft."
Relation Type: CEO Of
3. Open Relationship Extraction (OpenRE)
Open Relationship Extraction identifies relationships directly from text without relying on predefined relation categories. It extracts the relationship as it naturally appears in the sentence.
Example:
"The Eiffel Tower is located in Paris."
Extracted Relationship: (Eiffel Tower, is located in, Paris)
4. Cross-Sentence Relationship Extraction
Cross-Sentence Relationship Extraction identifies relationships between entities that are mentioned across multiple sentences rather than within a single sentence.
Example:
"Marie Curie was a renowned scientist. She won two Nobel Prizes."
The relationship between Marie Curie and Nobel Prizes is extracted by combining information from both sentences.
Implementation Using spaCy
Rule-Based Relationship Extraction uses the dependency parser provided by spaCy to identify grammatical relationships between entities in a sentence. It extracts the subject, relation (verb), and object to form a structured relationship.
Step 1: Install the spaCy library and download the English language model.
!pip install spacy
Step 2: Import the spaCy library.
import spacy
Step 3: Load the pretrained English language model.
nlp = spacy.load("en_core_web_sm")
Step 4: Provide a sentence containing entities and their relationship.
text = "Musk founded SpaceX in 2002."
doc = nlp(text)
Step 5: Identify the subject, relation, and object using dependency parsing.
subject = ""
relation = ""
obj = ""
for token in doc:
    if token.dep_ == "ROOT":
        relation = token.text
        for child in token.children:
            if child.dep_ in ("nsubj", "nsubjpass"):
                subject = child.text
            elif child.dep_ in ("dobj", "pobj", "attr"):
                obj = child.text
print("Subject :", subject)
print("Relation:", relation)
print("Object  :", obj)
Output:
Subject : Musk
Relation: founded
Object : SpaceX
Implementation Using Transformers
Transformer-based models are widely used in Relationship Extraction pipelines to identify named entities from text. These identified entities serve as the input for extracting semantic relationships between them.
Step 1: Install the Transformers library.
!pip install transformers torch
Step 2: Import the Hugging Face pipeline.
from transformers import pipeline
Step 3: Load a pretrained BERT model for Named Entity Recognition.
ner_pipeline = pipeline(
    "ner",
    model="dbmdz/bert-large-cased-finetuned-conll03-english",
    aggregation_strategy="simple"
)
Step 4: Provide a sentence containing entities.
text = "Elon Musk founded SpaceX in 2002."
Step 5: Pass the text to the transformer model.
entities = ner_pipeline(text)
for entity in entities:
    print(
        f"Entity: {entity['word']}, "
        f"Type: {entity['entity_group']}"
    )
Output:
Entity: Elon Musk, Type: PER
Entity: SpaceX, Type: ORG
You can download the complete source code from here.
Applications
- Knowledge Graph Construction: Extracts relationships between entities to build structured knowledge graphs for efficient knowledge representation and retrieval.
- Question Answering Systems: Identifies relationships between entities to retrieve accurate answers from unstructured text and knowledge bases.
- Information Retrieval: Enhances search systems by understanding entity relationships, enabling more relevant and context-aware search results.
- Healthcare and Biomedical Analysis: Extracts relationships between diseases, symptoms, drugs, and treatments from medical records and research articles.
- Financial Analysis: Identifies relationships among companies, organizations, people, and financial events to support market analysis and risk assessment.
Advantages
- Converts unstructured text into structured relationship data.
- Automatically identifies semantic relationships between entities.
- Improves knowledge discovery from large text collections.
- Enhances information retrieval and question answering systems.
- Reduces manual effort in extracting relational information.
Limitations
- Performance depends on accurate named entity recognition.
- Complex sentence structures can make relationship identification difficult.
- Ambiguous or implicit relationships may not be extracted correctly.
- Domain-specific text often requires specialized models or training data.
- Long or cross-sentence relationships are more challenging to identify accurately.
- Transformer-based models require significant computational resources for training and inference.
