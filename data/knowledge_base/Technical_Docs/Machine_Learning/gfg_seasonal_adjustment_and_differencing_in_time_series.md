# Seasonal Adjustment and Differencing in Time Series

> Source: https://www.geeksforgeeks.org/machine-learning/seasonal-adjustment-and-differencing-in-time-series/

Time series data can be difficult to evaluate successfully because of the patterns and trends it frequently displays. To address these tendencies and improve the data's suitability for modeling and analysis, two strategies are employed: seasonal adjustment and differencing.
Table of Content
Seasonal Adjustment
Seasonal adjustment is a statistical technique used to remove the effects of regular, repeating patterns (seasonal variations) from a time series dataset. Seasonal variations refer to the predictable fluctuations or patterns that occur at specific intervals, often corresponding to certain times of the year, months, weeks, or days. These patterns can obscure the underlying trends and make it challenging to analyze the true behavior of the data.
The primary goal of seasonal adjustment is to isolate and understand the non-seasonal components of a time series, such as trends and irregular fluctuations. This process allows for a clearer analysis of the underlying patterns, making it easier to identify long-term trends, make accurate forecasts, and detect unusual events.
Key steps in seasonal adjustment include:
- Identifying Seasonal Patterns:
  - Analyze the time series to identify repeating patterns that occur at regular intervals. These patterns may be related to seasons, holidays, or other periodic events.
- Decomposition:
  - Decompose the time series into its different components, typically separating it into trend, seasonal, and residual (error) components. The trend represents the long-term movement, the seasonal component captures the repeating patterns, and the residual component includes the irregular fluctuations.
- Adjustment:
  - Adjust the time series by removing or smoothing out the seasonal component.
Decomposing Time Series
Seasonality in time series can be represented by breaking it down into a trend component, a seasonal component, and an irregular component. There are several methods to decompose a time series into its trend, seasonal, and residual components. The most common approach is Additive Decomposition.
Additive Decomposition
where,
- Y_t is the actual value of the time series at time t.
- T_t is the trend component at time t.
- S_t is the seasonal component at time t.
- E_t is the irregular(error) component at time t.
The additive decomposition assumes that the effects of trend, seasonality, and residuals are separate and non-interacting. The observed value at any given time is the sum of these three components. This model is appropriate when the impact of each component on the total value is considered to be independent and straightforwardly additive.
Trend Estimation
Compute the moving average to capture the trend. We can use a simple moving average or other techniques like exponential smoothing. Here, we're using moving average.
The trend component represents the long-term movement or underlying growth/decay pattern in the time series. It reflects the overall direction in which the time series is heading, abstracting from short-term fluctuations.
In an additive decomposition, the trend component contributes to the total value independently of the other components. The moving average is a common technique used for trend estimation in time series analysis.
The moving average is computed by taking the average of the values over a specified number of periods, which is m in this case.
Where,
- Y_t the value at time t.
- k is the number of periods in the moving average.
It is particularly useful for removing short-term fluctuations and highlighting the overall direction of the data.
Compute Detrended Series
Subtract the moving average from the original time series to obtain a detrended series.
Calculate the Seasonal Component
The seasonal component represents the average pattern or deviation from the overall trend that occurs in each season across multiple years. It helps identify recurring patterns or cycles that are not part of the long-term trend.
Where, n be the number of seasons.
The choice of n depends on the periodicity of the seasonality in the data. For example, if you observe a yearly seasonality, n would be set to 12 for monthly data.
Calculate Residuals
Residuals represent the remaining variation in the time series after accounting for both the trend and the seasonal component.
It helps defining the unexplained variation or noise in the time series data Residuals are important for model diagnostics and validation. A good forecasting model should have residuals that are random and show no discernible pattern. If patterns are present in the residuals, it suggests that the model may need further refinement.
This is most suitable when the seasonal fluctuations remain constant in size regardless of the overall level of the series. Alternatively, there is a multiplicative form of this decomposition that may be more appropriate depending on the characteristics of the data and the relationship between the components.
Why it is important to adjust seasonal variation?
Seasonal changes are important for a number of reasons:
- Finding Trends and Cycles: Seasonal adjustments make it easier to see underlying trends and cyclical swings in the data by eliminating seasonal patterns. This is especially crucial for economic data as seasonal variations may obscure significant trends in employment, sales, and other economic metrics.
- Comparing Data Points: Seasonal adjustments allow for meaningful comparisons between data points from various time periods or seasons. Due to the impact of seasonal changes, comparisons may be deceptive in the absence of seasonal adjustments.
- Forecasting and Analysis: Seasonal adjustments enhance the precision of statistical studies and forecasting models. These models are more effective at identifying underlying patterns and correlations in the data by eliminating seasonal noise.
Advantages of Seasonal Adjustment
- Better Forecasting: By exposing underlying patterns and trends that are independent of seasonal variations, seasonal adjustment enables more accurate forecasting.
- Improved Trend Analysis: By separating the impacts of seasonality, it makes it easier to comprehend and analyze long-term patterns in the data.
- Comparability: Since seasonal influences are eliminated, seasonally adjusted data facilitates the comparison and analysis of various time periods.
Disadvantages of Seasonal Adjustment
- Assumption of Consistency: Seasonal adjustment is predicated on the idea that seasonal patterns would stay mostly unchanged over time. This assumption may not hold true if there are substantial changes in the underlying environmental or economic circumstances.
- Data Smoothing: The data is smoothed throughout the seasonal adjustment process, which may cause certain short-term swings to be lost and make it more difficult to spot abrupt shifts or abnormalities.
- Complexity: The implementation of some sophisticated seasonal adjustment methods might be challenging and call for a solid grasp of statistical methodology.
Seasonal Differencing
The process of calculating the differences between successive observations in a given time series is known as differencing. Higher-order differences may be obtained by further differentiating the resultant series, which is referred to as the first difference.
The main goal of differencing is to remove non-constant variation and trends from a time series while also stabilizing the mean. When working with non-stationary data—where the statistical characteristics of the series fluctuate over time.
Difference is used in time series analysis to adjust the mean and remove trends or time periods in the data, idea is to calculate the difference between a series of observations at timeline intervals resulting in a new series of data points that represent changes from one period to another rather than absolute values. Differences are useful when dealing with nonstationary time series data, where the mean, variance, or other statistical features change over time The observation and analysis of nonstationary data can be more complicated, and differentiation is a common method of converting such information into a stable form.Each value in the time series is subtracted from the preceding value in first-order differencing.
As a result, a new series is created that symbolizes the transition from one era to the next. Subtracting the second-lag value from the present value is the process of higher-order differencing, and so on.
Types of Seasonal Differencing
First-order differencing
The first-order differencing for a time series 
Where,
- Y_t' is the first-order differenced value at time t
- Y_t is the original value at time t
- Y_{t-1} is the original value at time t-1
First-order differencing removes the immediate trend from the data. It reveals the rate of change between consecutive observations, making it easier to analyze seasonality and cyclical patterns.
Second-order differencing
The Second-order differencing for a time series 
Second-order differencing removes the trend in the rate of change, highlighting any underlying seasonality or long-term cycles. However, it also removes some information about the original data and can increase variance, making it susceptible to noise.
The general form for differencing of any order d for a time series 
Where, Yt-(d-1) is the (d-1)th-order differenced value at time t.
Increasing the differencing order further removes higher-frequency components like short-term seasonality and cyclical patterns. However, it can also lead to loss of information and increased vulnerability to noise.
Choosing the Appropriate Seasonal Differencing Order
The appropriate differencing order depends on the specific factors of time series data like:
- Trend: How strong is the trend? First-order differencing will be enough to remove it.
- Seasonality: Does the data exhibit seasonal patterns? Second-order differencing will be needed for these.
- Noise: How much noise is present in the data? Higher orders of differencing can amplify noise.
Why is Seasonal Differencing important?
Differentiating is crucial for a number of reasons.
- The assumption of stationarity is a fundamental feature of many statistical models, including autoregressive and ARIMA models. Differencing is appropriate for these models since it can convert a non-stationary series into a stationary one.
- Forecasting Accuracy: By eliminating autocorrelation—the association between values in a time series at various lags—differencing may increase the precision of forecasting models. Distancing aids in mitigating the forecasting bias that autocorrelation may cause.
- Trend and Cycle Analysis: By eliminating short-term changes from a time series, differencing may assist in identifying patterns and cycles. In the analysis of economic data, where seasonal and irregular variables might obscure underlying patterns, this can be very helpful.
Advantages of Seasonal Differencing
- Stationarity: By helping to achieve stationarity, differencing facilitates the use of many statistical approaches that presume constant statistical features in the modeling and analysis of time series data.
- Trend Removal: Differencing efficiently eliminates the impact of trends by calculating the differences between successive data, giving rise to a more lucid picture of the irregular and cyclical components.
- Simplicity: Variance is a somewhat easy approach that may be used by a wide variety of users, since it doesn't need advanced statistical understanding.
DisadvantagesSeasonal Differencing
- Information Loss: More complex differencing may result in information loss and increase the difficulty of interpreting the changed data.
- Sensitivity to Parameter Selection: The choice of the differencing parameter might have an impact on how successful differencing is; choosing the wrong value could result in either over-differencing or insufficient trend removal.
- Inability to Address Seasonality: Seasonality in the data may need to be addressed using other approaches, such as seasonal adjustment, if differencing is found to be insufficient.
Seasonal Adjustment and Differencing Implementation
Step 1: Install Necessary Libraries
!pip install pandas
!pip install statsmodels
!pip install matplotlib
Step 2: Import Libraries
import pandas as pd
import statsmodels.api as sm
import matplotlib.pyplot as plt
Step 3: Load Dataset
url = 'https://raw.githubusercontent.com/jbrownlee/Datasets/master/airline-passengers.csv'
df = pd.read_csv(url)
df['Month'] = pd.to_datetime(df['Month'])
df.set_index('Month', inplace=True)
Step 4: Seasonal Adjustment
Here, 'seasonal_decompose' function is used from the Statsmodels library in to decompose a time series into its trend, seasonal, and residual (irregular or error) components. Multiplicative decomposition is used with a period of 12 (assuming monthly data), meaning that the seasonal component repeats every 12 observations.
# Seasonal adjustment
result = sm.tsa.seasonal_decompose(df['Passengers'], model='multiplicative', period=12)
df['Seasonal_Adjusted'] = result.resid
Step 5: Differencing
# Differencing
df['Differenced'] = df['Passengers'].diff()
Step 6: Visualize the Results
# Visualize the results
plt.figure(figsize=(12, 8))
# Original time series
plt.subplot(3, 1, 1)
plt.plot(df['Passengers'])
plt.title('Original Time Series')
plt.xlabel('Month')
plt.ylabel('Passengers')
# Seasonal Adjusted
plt.subplot(3, 1, 2)
plt.plot(df['Seasonal_Adjusted'])
plt.title('Seasonal Adjusted Time Series')
plt.xlabel('Month')
plt.ylabel('Seasonal Adjusted Passengers')
# Differenced
plt.subplot(3, 1, 3)
plt.plot(df['Differenced'])
plt.title('Differenced Time Series')
plt.xlabel('Month')
plt.ylabel('Differenced Passengers')
plt.tight_layout()
plt.show()
Output:
In this part, a subplot containing three panels that each highlight a distinct time series feature is created using Matplotlib
- The original time series is shown in the first subplot.
- The adjusted for seasons time series is shown in the second subplot.
- The distinct time series data are shown in the third subplot.
- The plot is seen in full by using the plt.show() function.
The output displays the seasonally adjusted time series, the differenced time series, and the original time series of airline passenger counts. The original data's seasonal oscillations are eliminated from the seasonally adjusted time series, which facilitates the identification of the underlying trend. The data are stationary due to the differenced time series, which is crucial for several statistical studies.
Conclusion
In time series analysis, seasonal adjustment and differencing are two crucial methods. A time series' trend component may be eliminated using differencing, but the seasonal component can be eliminated using seasonal adjustment. Forecasting models may be made more accurate by using both strategies.
