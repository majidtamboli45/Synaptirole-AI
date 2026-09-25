# Associative Classification in Data Mining

> Source: https://www.geeksforgeeks.org/data-science/associative-classification-in-data-mining/

Data mining is the process of discovering and extracting hidden patterns from different types of data to help decision-makers make decisions. Associative classification is a common classification learning method in data mining, which applies association rule detection methods and classification to create classification models.
Association Rule learning in Data Mining:
Association rule learning is a machine learning method for discovering interesting relationships between variables in large databases. It is designed to detect strong rules in the database based on some interesting metrics. For any given multi-item transaction, association rules aim to obtain rules that determine how or why certain items are linked.
Association rules are created by searching for information on common if-then patterns and using specific criteria with support and trust to define what the key relationships are. They help to show the frequency of an item in a given data since confidence is defined by the number of times an if-then statement is found to be true. However, a third criterion called lift is often used to compare expected and actual confidence. Lift shows how many times the if-then statement was predicted to be true. Create association rules to compute itemsets based on data created by two or more items. Association rules usually consist of rules that are well represented by the data.
There are different types of data mining techniques that can be used to find out the specific analysis and result like Classification analysis, Clustering analysis, and multivariate analysis. Association rules are mainly used to analyze and predict customer behavior.
- In Classification analysis, it is mostly used to question, make decisions, and predict behavior.
- In Clustering analysis, it is mainly used when no assumptions are made about possible relationships in the data.
- In Regression analysis, it is used when we want to predict an infinitely dependent value of a set of independent variables.
How does Association Rule Learning work?
Association rule learning is a type of unsupervised learning technique that checks for the dependency of one data item on another data item and maps accordingly so that it can be more profitable. It is based on different rules to discover the interesting relations between variables in the database. The association rule learning is one of the very important concepts of machine learning, and it is employed in Market Basket analysis, Web usage mining, continuous production, etc. Here market basket analysis is a technique used by the various big retailer to discover the associations between items.
Association rule learning works on the concept of If and Else Statement, such as if A then B.
Here the If element is called antecedent, and then statement is called as Consequent.
These types of relationships where we can find out some association or relation between two items is known as single cardinality. It is all about creating rules, and if the number of items increases, then cardinality also increases accordingly. So, to measure the associations between thousands of data items, there are several metrics. These metrics are given below:
- Support
- Confidence
- Lift
1.Support :
Support is the frequency of A or how frequently an item appears in the dataset. It is defined as the fraction of the transaction T that contains the itemset X. If there are X datasets, then for transactions T, it can be written as:
Supp(X) = Freq(X) / T
2.Confidence:
Confidence indicates how often the rule has been found to be true. Or how often the items X and Y occur together in the dataset when the occurrence of X is already given. It is the ratio of the transaction that contains X and Y to the number of records that contain X.
Confidence = Freq(X,Y) / Freq(X)
3.Lift:
It is the strength of any rule, which can be defined as below formula: It is the ratio of the observed support measure and expected support if X and Y are independent of each other. It has three possible values:
Lift = Supp(X,Y) / Supp(X)*Supp(Y)
- If Lift= 1: The probability of occurrence of antecedent and consequent is independent of each other.
- Lift>1: It determines the degree to which the two itemsets are dependent to each other.
- Lift<1: It tells us that one item is a substitute for other items, which means one item has a negative effect on another.
Types of Association Rule Learning:
Association rule learning can be divided into three algorithms:
1.Apriori Algorithm:
This algorithm uses frequent datasets to generate association rules. It is designed to work on the databases that contain transactions. This algorithm uses a breadth-first search and Hash Tree to calculate the itemset efficiently. It is mainly used for market basket analysis and helps to understand the products that can be bought together. It can also be used in the healthcare field to find drug reactions for patients.
2.Eclat Algorithm:
Eclat algorithm stands for Equivalence Class Transformation. This algorithm uses a depthfirst search technique to find frequent itemsets in a transaction database. It performs faster execution than Apriori Algorithm.
3.F-P Growth Algorithm:
The F-P growth algorithm stands for Frequent Pattern, and it is the improved version of the Apriori Algorithm. It represents the database in the form of a tree structure that is known as a frequent pattern or tree. The purpose of this frequent tree is to extract the most frequent pattern.
Applications of Association Rule Learning:
It has various applications in machine learning and data mining. Below are some popular applications of association rule learning:
- Market Basket Analysis: It is one of the popular examples and applications of association rule mining. This technique is commonly used by big retailers to determine the association between items.
- Medical Diagnosis: With the help of association rules, patients can be cured easily, as it helps in identifying the probability of illness for a particular disease.
- Protein Sequence: The association rules help in determining the synthesis of artificial Proteins.
- It is also used for the Catalog Design and Loss-leader Analysis and many more other applications.
Associative Classification in Data Mining:
Bing Liu Et Al was the first to propose associative classification, in which he defined a model whose rule is "the right-hand side is constrained to be the attribute of the classification class".An associative classifier is a supervised learning model that uses association rules to assign a target value.
The model generated by the association classifier and used to label new records consists of association rules that produce class labels. Therefore, they can also be thought of as a list of "if-then" clauses: if a record meets certain criteria (specified on the left side of the rule, also known as antecedents), it is marked (or scored) according to the rule's category on the right. Most associative classifiers read the list of rules sequentially and apply the first matching rule to mark new records. Association classifier rules inherit some metrics from association rules, such as Support or Confidence, which can be used to rank or filter the rules in the model and evaluate their quality.
Types of Associative Classification:
There are different types of Associative Classification Methods, Some of them are given below.
1. CBA (Classification Based on Associations): It uses association rule techniques to classify data, which proves to be more accurate than traditional classification techniques. It has to face the sensitivity of the minimum support threshold. When a lower minimum support threshold is specified, a large number of rules are generated.
2. CMAR (Classification based on Multiple Association Rules): It uses an efficient FP-tree, which consumes less memory and space compared to Classification Based on Associations. The FP-tree will not always fit in the main memory, especially when the number of attributes is large.
3. CPAR (Classification based on Predictive Association Rules): Classification based on predictive association rules combines the advantages of association classification and traditional rule-based classification. Classification based on predictive association rules uses a greedy algorithm to generate rules directly from training data. Furthermore, classification based on predictive association rules generates and tests more rules than traditional rule-based classifiers to avoid missing important rules.
