# Understanding the Moving average (MA) in Time Series Data

> Source: https://www.geeksforgeeks.org/machine-learning/understanding-the-moving-average-ma-in-time-series-data/

Data is often collected with respect to time, whether for scientific or financial purposes. When data is collected in a chronological order, it is referred to as time series data. Analyzing time series data provides insights into how the data behaves over time, including underlying patterns that can help solve problems in various domains. Time series analysis can also aid in forecasting future values based on historical data, leading to better production, profits, policy planning, risk management, and other fields. Therefore, analysis of time series data becomes an important aspect of data science.
In this article, we will discuss Moving Average Models, which are essential for time series analysis and forecasting trends.
What is the Moving Average Model?
Moving Average Models are a type of time series analysis model usually used in econometrics to forecast trends and understand patterns in time series data. In moving average models the present value of the time series depends on the linear combination of the past white noise error terms of the time series. In time series analysis moving average is denoted by the letter "q" which represents the order of the moving average model, or in simple words we can say the current value of the time series will depend on the past q error terms. Therefore, the moving average model of order q could be represented as:
Here,
- \bold X_{\bold t} is the value of time series at time t
- c is a constant or the mean of the time series
- \bold \epsilon_{\bold t}, \bold \epsilon_{\bold {t-1}}, \bold \epsilon_{\bold {t-2}}, ... , \bold \epsilon_{\bold {t-q}} are the white noise terms associated with the time series at time t, t-1, t-2, ... , t-q.
- \bold \theta_{\bold 1}, \bold \theta_{\bold 2}, ... , \bold \theta_{\bold q} are the moving average constants.
For example, if we consider MA(1) model, in this model the present value of the time series will only depend on a single past error term and the time series becomes:
From this observation we can also conclude one of the most important aspects of moving average models that the higher the value of the order of moving average model (q), the model will have longer memory and dependence on the past values.
Interpretation of MA model:
There is a difference in the shock wave that is seen in the MA model and AR model that we can mention which might help us get a better understanding how MA and AR model differ. For a better understanding let's look at the AR model's general form as well:
- First that the past noise term \epsilon_{t-1} affects the MA model's present valueX_t directly as we can see in the above equation of the MA model but in AR model the past noise term(\epsilon_{t-1} ) have an indirect influence on the present AR model value(X_t ) since the AR model equation depends on the previous value of the model(X_{t-1} ) and the previous model value depends on it's noise term(\epsilon_{t-1} ).
- The MA model works a a finite impulse model, which means that the current noise value affects the present value of the model as well as "q" further values, as the moving average models only depend on q terms in the past. Whereas AR models acts as infinite impulse model since the current noise affects infinite values of the model in the future. In AutoRegressive model \epsilon_t value affects theX_t term which affects theX_{t+1} term and so on.
Concept Related to Moving Average:
Now let's discuss about some of the concepts that can help us in understanding the moving average model in a better way:
- Stationarity: Stationarity is the principle of time series data that conveys that the statistical properties of the data doesn't change with time, the mean of the data remains the same or we can also say that the data fluctuates around a certain value, the standard deviation of the time series data nearly remains constant, and there must not be any seasonality in the time series data or there is no periodic behavior in the data. We can check for the stationarity of the dataset visually as well as through Augmented Dickey-Fuller(ADF) Test. We consider stationarity to be one of the most important aspect that the time series data must possess in order to be accepted by the models that are applied to time series data for accurate modelling.
- Differencing: Differencing is one of the most important steps to consider during time series analysis, after taking a peek at the original time series data, if the data is not stationary and contains a lot of trends then differencing must be considered since for accurate time series data analysis the data must be stationary. In regular differencing the current time series data is subtracted by the previous data point. \Delta y_t = y_t - y_{t-1} , this method removes trends from the data, making it suitable for modelling.
- White Noise: White noise is the error term which has the mean of zero and a constant standard deviation with no correlation of the data points with each other. White noise acts as a benchmark in the forecasting process through time series modelling, if the forecast error is nor white noise further modifications could be performed on the model, but if it reaches a state such that the forecast errors are white noise then the model would need no further improvements. The value of white noise series are random and unpredictable therefore if any time series data is a white noise then there is no method to model or forecast it.
- ACF Plot: Autocorrelation Function plot or the ACF plot is the plot of correlation between the time series and its lagged version. It shows how similar the time series is with it's different lagged values. Here the lag term is a fixed time displacement, in the ACF plot the x-axis is the lagged time series and the y-axis is the correlation which ranges from -1 to 1.
Let's look at a code example which can help us thoroughly understand the moving average model:
Moving Average (MA) Model Implementation
As we know that getting a time series data that is truly stationary in nature without differencing is difficult, since most of the data in the real world are not stationary in nature. After the brief discussion of the moving average model now we will be implementing the code example for the same. We will be using the Yahoo Finance data to collect the data of Advanced Micro Devices, Inc(AMD) stock and model it with moving average model.
Importing Libraries:
The code mentioned imports important libraries including pandas for data manipulation, numpy for mathematical computation, matplotlib for plotting the different graphs and measure relationships between variables, plot_acf and plot_pacf for plotting acf and pacf plots of the data to identify model order. ARIMA model to fit the order of the model and forecast the data provided. We will be importing yfinance which stands for yahoo finance through which we will get the access to the stock price of AMD and warnings to filter the unnecessary warnings that pop up with output. At the end we will be using matplotlib's rcParams method which will help in setting the figure size as (15, 5), since our dataset will be spreadout.
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from statsmodels.tsa.arima.model import ARIMA
import yfinance as yf
import warnings
warnings.filterwarnings("ignore")
plt.rcParams['figure.figsize'] = 15, 5
Downloading the Stock Price of AMD and Plotting Closing Price:
Here first we will be downloading the AMD stock price and saving the values from 1st January, 2020 into a variable called AMD_values the .history method lets us go back in history and extract value from any time where the value of the stock existed. The AMD_values will act as a time series in our example, after these steps we will be plotting the closing price of the AMD_values dataframe.
AMD = yf.Ticker("AMD")
# getting the historical market data
AMD_values = AMD.history(start="2020-01-01")
# Plotting the close price of AMD
AMD_values[['Close']].plot();
Output:
Calculating and Plotting Rolling Average Values:
Now in the next step the we will be calculating 10-day rolling average values of closing price and adding it as a new column named rolling_av, we are calculating the rolling average value of the closing data since it helps in smoothing out the fluctuations in the time series data, such that the data could be modelled and analyzed in a better way. After this step we will be plotting the closing value and the rolling average value of the data.
AMD_values['rolling_av'] = AMD_values['Close'].rolling(10).mean()
# plotting 10-day rolling average value with the closing value
AMD_values[['Close','rolling_av']].plot();
Output:
ACF and PACF Plots of the Data:
Here first we will be defining a function which takes the time series data as a parameter and generate the ACF and PACF plots of it, after defining such function we will be fitting the data we are modelling. We will be plotting last 20 lags to see how the current data depends on the past noise data.
# Function to plot ACF and PACF
def plot_acf_pacf(timeseries):
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 7))
    plot_acf(timeseries, ax=ax1, lags=75)
    plot_pacf(timeseries, ax=ax2, lags=75)
    plt.show()
# Plotting ACF and PACF of the closing value time series
plot_acf_pacf(AMD_values['Close'])
Output:
Here, we can see in the ACF plot that the first lag has a correlation of 1 since is the same error term as that of the current time series but from the second lag we can see that the ACF plot is reducing but the correlation value between the lags decreases slowly, here if we model more lag values, we'll find out the order of q gets more than 50.
The blue region signifies where the values are no longer statistically significant. From the above plot, we can that see that the last significant lag is the 55. Therefore, our model order for the MA model will be 55. The value of q to be 55 which means the current value will depend on the last 55 error values of the data.
Fitting the MA Model and Checking for Statistical Appropriation:
In the next step we will be fitting an ARIMA model to the closing prices of AMD stock with an order of (0, 0, 55), indicating 55 lags for the moving average component or the order of the moving average model to be 55. After that we will be printing the summary of the fitted ARIMA model such that the coefficient of the past noise values could be analyzed.
#creating the model
MA_model = ARIMA(endog=AMD_values['Close'], order=(0, 0, 55))
#fitting data to the model
results = MA_model.fit()
#summary of the model
print(results.summary())
Output:
                               SARIMAX Results                                
==============================================================================
Dep. Variable: Close No. Observations: 1030
Model: ARIMA(0, 0, 55) Log Likelihood -2607.721
Date: Tue, 06 Feb 2024 AIC 5329.441
Time: 12:13:34 BIC 5610.868
Sample: 0 HQIC 5436.250
- 1030
Covariance Type: opg
==============================================================================
coef std err z P>|z| [0.025 0.975]
------------------------------------------------------------------------------
const 91.7676 4.863 18.872 0.000 82.237 101.298
ma.L1 0.9881 0.032 31.180 0.000 0.926 1.050
ma.L2 1.0082 0.043 23.566 0.000 0.924 1.092
ma.L3 1.0546 0.050 20.986 0.000 0.956 1.153
ma.L4 1.0883 0.060 18.148 0.000 0.971 1.206
ma.L5 1.1193 0.066 16.895 0.000 0.989 1.249
ma.L6 1.1757 0.075 15.578 0.000 1.028 1.324
ma.L7 1.2618 0.082 15.314 0.000 1.100 1.423
ma.L8 1.2647 0.088 14.362 0.000 1.092 1.437
ma.L9 1.2961 0.095 13.599 0.000 1.109 1.483
ma.L10 1.2716 0.102 12.493 0.000 1.072 1.471
ma.L11 1.3053 0.110 11.899 0.000 1.090 1.520
ma.L12 1.3568 0.118 11.528 0.000 1.126 1.588
ma.L13 1.3790 0.125 11.042 0.000 1.134 1.624
ma.L14 1.4370 0.131 10.989 0.000 1.181 1.693
ma.L15 1.4226 0.136 10.447 0.000 1.156 1.689
ma.L16 1.4259 0.141 10.105 0.000 1.149 1.703
ma.L17 1.3422 0.148 9.098 0.000 1.053 1.631
ma.L18 1.3952 0.149 9.377 0.000 1.104 1.687
ma.L19 1.3681 0.155 8.826 0.000 1.064 1.672
ma.L20 1.4254 0.160 8.897 0.000 1.111 1.739
ma.L21 1.3960 0.162 8.592 0.000 1.078 1.715
ma.L22 1.2811 0.167 7.666 0.000 0.954 1.609
ma.L23 1.2373 0.169 7.303 0.000 0.905 1.569
ma.L24 1.2439 0.172 7.214 0.000 0.906 1.582
ma.L25 1.2424 0.173 7.177 0.000 0.903 1.582
ma.L26 1.2532 0.175 7.165 0.000 0.910 1.596
ma.L27 1.2763 0.177 7.221 0.000 0.930 1.623
ma.L28 1.2407 0.176 7.046 0.000 0.896 1.586
ma.L29 1.1452 0.178 6.452 0.000 0.797 1.493
ma.L30 1.1320 0.175 6.458 0.000 0.788 1.476
ma.L31 1.1204 0.174 6.436 0.000 0.779 1.462
ma.L32 1.0165 0.175 5.798 0.000 0.673 1.360
ma.L33 0.9564 0.175 5.480 0.000 0.614 1.298
ma.L34 0.9079 0.172 5.267 0.000 0.570 1.246
ma.L35 0.8531 0.169 5.058 0.000 0.523 1.184
ma.L36 0.7645 0.166 4.605 0.000 0.439 1.090
ma.L37 0.7301 0.163 4.493 0.000 0.412 1.049
ma.L38 0.7081 0.157 4.504 0.000 0.400 1.016
ma.L39 0.6063 0.154 3.932 0.000 0.304 0.909
ma.L40 0.4872 0.148 3.293 0.001 0.197 0.777
ma.L41 0.3681 0.144 2.553 0.011 0.085 0.651
ma.L42 0.3342 0.139 2.410 0.016 0.062 0.606
ma.L43 0.3415 0.134 2.546 0.011 0.079 0.604
ma.L44 0.3485 0.129 2.710 0.007 0.096 0.601
ma.L45 0.3279 0.123 2.660 0.008 0.086 0.569
ma.L46 0.3315 0.118 2.807 0.005 0.100 0.563
ma.L47 0.3224 0.113 2.860 0.004 0.101 0.543
ma.L48 0.2858 0.105 2.734 0.006 0.081 0.491
ma.L49 0.2297 0.095 2.429 0.015 0.044 0.415
ma.L50 0.2450 0.087 2.823 0.005 0.075 0.415
ma.L51 0.1928 0.078 2.464 0.014 0.039 0.346
ma.L52 0.1343 0.070 1.923 0.054 -0.003 0.271
ma.L53 0.1699 0.059 2.885 0.004 0.054 0.285
ma.L54 0.1631 0.049 3.351 0.001 0.068 0.258
ma.L55 0.0760 0.035 2.165 0.030 0.007 0.145
sigma2 9.1346 0.333 27.418 0.000 8.482 9.788
===================================================================================
Ljung-Box (L1) (Q): 0.00 Jarque-Bera (JB): 138.76
Prob(Q): 0.96 Prob(JB): 0.00
Heteroskedasticity (H): 1.70 Skew: 0.33
Prob(H) (two-sided): 0.00 Kurtosis: 4.68
===================================================================================
From the statistical point of view we can see that coeff. of the constant is 91 which works as the mean of the closing value of the dataset and we can observe the coefficient of the noise values from ma.L1 - ma.L55 and the p values are all near 0, therefore, these observations are significant.
Predicting the values and printing some of the values:
#prediction data
start_date = '2023-12-15'
end_date   = '2024-02-05'
AMD_values['prediction'] = results.predict(start=start_date, end=end_date)
#printing last 14 values of the prediction with original and rolling avg value
print(AMD_values[['Close','rolling_av','prediction']].tail(14))
Output:
                                Close  rolling_av  prediction
Date
2024-01-17 00:00:00-05:00 160.169998 146.737999 159.708700
2024-01-18 00:00:00-05:00 162.669998 149.472998 160.559394
2024-01-19 00:00:00-05:00 174.229996 153.294998 163.174427
2024-01-22 00:00:00-05:00 168.179993 156.254997 172.220122
2024-01-23 00:00:00-05:00 168.419998 158.478998 167.267264
2024-01-24 00:00:00-05:00 178.289993 161.381998 168.262082
2024-01-25 00:00:00-05:00 180.330002 164.560999 178.427955
2024-01-26 00:00:00-05:00 177.250000 167.483998 180.498107
2024-01-29 00:00:00-05:00 177.830002 170.610999 178.240948
2024-01-30 00:00:00-05:00 172.059998 171.942998 176.777833
2024-01-31 00:00:00-05:00 167.690002 172.694998 169.790058
2024-02-01 00:00:00-05:00 170.479996 173.475998 167.889296
2024-02-02 00:00:00-05:00 177.660004 173.818999 171.422463
2024-02-05 00:00:00-05:00 174.229996 174.423999 177.279664
Through the table we can conclude that the moving average model of order 15 is pretty good for the given dataset as the predictions value nearly matches the original closing value of the daily AMD stock price
Plotting Forcasted values with Original Data:
At the last step predictions are plotted with the original data set and the rolling value of the original value. This visualization helps compare the model's forecasts against the actual data.
# Forecast future values
# Forecast future closing prices
forecast_steps = 30  # Forecasting for the next 30 days
forecast_index = pd.date_range(start=AMD_values['Close'].index[-1], periods=forecast_steps+1, freq='D')[1:]  # Generate datetime index for forecast
forecast = results.forecast(steps=forecast_steps)
# plotting the end results
AMD_values[['Close','rolling_av','prediction']].plot()
plt.plot(forecast_index, forecast, color='red', label='Forecast')
Output:
The green line shows the predicted value by the moving average model, the blue line represents the original data that we are modelling in this code example and the orange plot is the rolling average value plot of the original data. The green line follows the trend in a pretty good way; therefore, we can conclude that the moving average model was good in analyzing the AMD stock data. The red line represents the forecasting values for next 30 days.
Advantages and Disadvantages of Using MA Model
There are certain advantages and disadvantages of using a moving average model that we must pay attention to in order to achieve better results in modelling and forecasting the time series data.
Advantages
- Noise Reduction: Moving average models are effective in smoothing out the noise which is present in the time series data, thus, it helps in reducing the short term fluctuations in the time series data.
- Stationarity: Moving average models within itself assumes that the time series data is stationary which is a primary requirement in the time series analysis.
- Ease of Understanding: It is not that tough to understand how the moving average models work in comparison to some of the other time series forecasting models. The order of the moving average model is the number of previous error terms on which the current value of the time series depends.
- Combination of models: The moving average models could be easily combined with autoregressive and integrated models and the whole of ARIMA modelling could be applied on the time series data.
Disadvantages
- Assumption of Stationarity: In moving average models it is already assumed that the time series data is stationary, but in reality, most of the real world data are not stationary. Therefore, in order to convert the time series data into stationary data information loss might happen.
- Limited Forecasting Range: Moving average models are suitable for short term forecasting, as the time increases model's forecasting capabilities decreases.
- Sensitivity to Outliers
- Identification of Model Order: If the model order is not chosen correctly the model might not be able to predict the time series data effectively.
Conclusion
Hence, we can conclude that analysis of the time series data with moving average model is possible but is only suitable for short period of time and the predictions are not good as the time span increases.
