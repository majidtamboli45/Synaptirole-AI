# Collaborative Filtering in Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/collaborative-filtering-ml/

A recommendation system analyses user behaviour and past activity to understand preferences and suggest relevant content, products or ideas. By tracking what users watch, click or interact with, it identifies patterns and continuously improves recommendations to enhance user experience and engagement.
- Tracks user activity like views, clicks and interactions
- Identifies patterns in user preferences
- Predicts likes and dislikes based on past behavior
- Recommends similar or relevant content
- Continuously updates suggestions with new data
- Improves personalization and user engagement
Collaborative Filtering
Collaborative filtering works by identifying users with similar preferences and recommending items based on what those similar users like. Instead of using item features, it groups users into clusters and suggests content according to the shared preferences of each group.
- Focuses on user behaviour, not item features
- Finds users with similar interests
- Groups users into clusters based on preferences
- Recommends items liked by similar users
Types of Collaborative Filtering Techniques
- Memory-Based: Uses user-item data directly to make recommendations
- Model-Based: Builds predictive models using machine learning
- Hybrid: Combines multiple approaches for better results
- Deep Learning: Uses neural networks for more advanced recommendations
Measuring Similarity in Collaborative Filtering
Collaborative filtering works by comparing user preferences and identifying similarities in their ratings. Based on these similarities, the system predicts what a user might like or dislike and recommends items accordingly. Example:
- User 1 and User 2 have nearly similar ratings (both liked Movie 1), showing similar preferences
- Based on this, Movie 3 (liked by User 2) can be recommended to User 1
- Similarly, Movie 4 (liked by User 1) can be recommended to User 2
- User 1 and User 3 have opposite tastes, so their recommendations will differ
- User 3 and User 4 share similar low ratings for Movie 2
- Since User 3 disliked Movie 4, it can be predicted that User 4 may also dislike Movie 4
Cosine Similarity in Collaborative Filtering
Cosine similarity measures how similar two users are based on their ratings. A higher cosine value means users have similar preferences, while a lower value means they are different. Missing values are often treated as 0 to simplify calculations.
- Measures similarity between users using their rating patterns
- Higher cosine value means more similar users
- Lower cosine value means less similar users
- Missing ratings can be filled with 0 for easy calculation
- Helps in recommending items liked by similar users
\text{similarity} = \frac{A \cdot B}{|A| \times |B|} = \frac{\sum_{i=1}^{n} A_i \times B_i}{\sqrt{\sum_{i=1}^{n} A_i^2} \times \sqrt{\sum_{i=1}^{n} B_i^2}} 
Rounding the Data
Rounding is used to simplify rating data by converting it into binary values. Ratings below 3 are set to 0 (dislike), and ratings 3 or above are set to 1 (like). This makes comparison between users faster and easier.
- Converts complex ratings into simple 0 and 1 values
- Improves readability of the data
- Makes similarity comparison more efficient
- Helps clearly identify similar user groups
Example:
- After rounding, User 1 and User 2 show similar patterns (more 1s) which means similar preferences
- User 3 and User 4 show similar patterns (more 0s) which means similar dislikes
Normalizing Rating
Normalization adjusts user ratings by subtracting each user’s average rating from their given ratings. This converts values into positive and negative scores, making it easier to compare user preferences fairly.
- Subtracts the user’s average rating from each rating
- Produces positive (above average) and negative (below average) values
- Removes bias of users who rate consistently high or low
- Helps group users with similar rating patterns
- Improves accuracy of recommendations by better similarity detection
Advantages
- Unlike content-based systems, it does not rely on limited item features making it more flexible in different use cases
- It can handle a wide variety of data since it learns from user interactions instead of predefined content
- It provides strong personalization by recommending items based on similar users’ preferences
- It adapts easily to changes in user behavior over time, improving recommendations continuously
- It performs well when large amounts of user data are available, increasing accuracy and relevance
Challenges
- As the number of users and items increases, computation and storage requirements grow significantly, making the system slower
- Scalability becomes a major issue with large datasets, affecting performance and accuracy
- Relies heavily on historical data, so it may struggle when there is limited or new user data
- Tends to recommend similar types of items repeatedly, reducing diversity in recommendations
- May not capture changing interests instantly if recent data is limited
