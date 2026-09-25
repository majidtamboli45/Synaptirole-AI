# Types of Association Rules in Data Mining

> Source: https://www.geeksforgeeks.org/data-science/types-of-association-rules-in-data-mining/

Association rule learning is a machine learning technique used for discovering interesting relationships between variables in large databases. It is designed to detect strong rules in the database based on some interesting metrics. For any given multi-item transaction, association rules aim to obtain rules that determine how or why certain items are linked. Association rules are created for finding information about general if-then patterns using specific criteria with support and trust to define what the key relationships are. They help to show the frequency of an item in specific data since confidence is defined by the number of times an if-then statement is found to be true.
Types of Association Rules:
There are various types of association rules in data mining:-
- Multi-relational association rules
- Generalized association rules
- Quantitative association rules
- Interval information association rules
1. Multi-relational association rules: Multi-Relation Association Rules (MRAR) is a new class of association rules, different from original, simple, and even multi-relational association rules (usually extracted from multi-relational databases), each rule element consists of one entity but many a relationship. These relationships represent indirect relationships between entities.
2. Generalized association rules: Generalized association rule extraction is a powerful tool for getting a rough idea of interesting patterns hidden in data. However, since patterns are extracted at each level of abstraction, the mined rule sets may be too large to be used effectively for decision-making. Therefore, in order to discover valuable and interesting knowledge, post-processing steps are often required. Generalized association rules should have categorical (nominal or discrete) properties on both the left and right sides of the rule.
3. Quantitative association rules: Quantitative association rules is a special type of association rule. Unlike general association rules, where both left and right sides of the rule should be categorical (nominal or discrete) attributes, at least one attribute (left or right) of quantitative association rules must contain numeric attributes
Uses of Association Rules
Some of the uses of association rules in different fields are given below:
- Medical Diagnosis: Association rules in medical diagnosis can be used to help doctors cure patients. As all of us know that diagnosis is not an easy thing, and there are many errors that can lead to unreliable end results. Using the multi-relational association rule, we can determine the probability of disease occurrence associated with various factors and symptoms.
- Market Basket Analysis: It is one of the most popular examples and uses of association rule mining. Big retailers typically use this technique to determine the association between items.
