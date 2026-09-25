# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/machine-learning/data-leakage/

Data leakage occurs when a model unintentionally uses information that would not be available during real-world predictions. This leads to overly optimistic performance during validation, as the model learns patterns it should not have access to, resulting in poor generalization in practical scenarios.
Types of Data Leakage
- Train-Test Contamination: Occurs when information from the test dataset is unintentionally used during training. This makes the model appear highly accurate during evaluation but it fails to perform well on unseen real-world data.
- Target Leakage: Happens when input features contain information that directly or indirectly reveals the target variable. For example, using future data or outcome-related features during training can lead to unrealistic predictions.
- Data Preprocessing Leakage: Arises when preprocessing steps like scaling, normalization or encoding are applied before splitting the dataset. This allows information from the test set to influence the training process.
- Temporal Leakage: Common in time-based data, where future information is used to predict past events. Since such data would not be available in real scenarios, it leads to misleading model performance.
Causes of Data Leakage
- Improper Data Splitting: Mixing training and testing data or splitting incorrectly allows information from the test set to influence training.
- Incorrect Preprocessing Workflow: Applying scaling, normalization or encoding before splitting the data causes hidden leakage from the test set.
- Using Future or Unavailable Data: Including features that won’t be available at prediction time (e.g., future outcomes or post-event data).
- Poor Feature Selection: Selecting features that are too closely related to the target variable, indirectly revealing the answer.
- Data Pipeline Mistakes: Errors in pipelines (like fitting transformations on full data) can unintentionally expose test data to the model.
- Merging External Data Incorrectly: Joining datasets without proper alignment (e.g., including future records) can introduce hidden leakage.
Impact of Data Leakage
- Overfitting to Test Data: Model appears highly accurate during evaluation but fails in real-world scenarios due to exposure to hidden information.
- Misleading Performance Metrics: Metrics like accuracy, precision and recall become unreliable, giving a false sense of model effectiveness.
- Poor Generalization: Model struggles on unseen data because training does not reflect real-world conditions.
- Loss of Trust and Reliability: Discovery of leakage reduces confidence in the model and the overall data science process.
Detection
- Feature importance analysis: If a particular feature seems overly predictive, check whether it contains future information.
- Cross-validation: A well-conducted cross-validation with proper data partitioning can reveal performance inconsistencies that suggest data leakage.
- Manual feature inspection: Examine features and their relationship with the target variable to see if any future information has been included.
Prevention
- Proper Data Splitting: Split data into training, validation and test sets before any preprocessing to avoid information leakage.
- Temporal Separation: Maintain chronological order in time-series data to prevent future information from influencing training.
- Feature Selection Discipline: Select and engineer features using only training data, avoiding any target or test-related information.
- Cross-Validation: Validate model performance on unseen data to ensure reliable evaluation.
- Controlled Data Preprocessing: Apply transformations (scaling, encoding) only on training data and reuse them on test data .
- Pipeline Auditing: Regularly review data pipelines and workflows to detect and prevent leakage early.
