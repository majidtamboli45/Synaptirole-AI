# Interpolation Formula

> Source: https://www.geeksforgeeks.org/maths/interpolation-formula

Interpolation is a statistical technique used to estimate an unknown value that falls between two known data points. It helps fill missing values and determine intermediate values based on the existing data.
The image above shows interpolation, where an unknown value (pink point) is estimated between two known values (green points).
There are various formulae used to find the interpolation, and some of them are,
- Linear Interpolation Formula
- Lagrange Interpolation Formula
- Leading Difference Formula
- Quadratic Interpolation Formula
Linear Interpolation Formula
This method is used where the given data set does not consist of more than two ordered pairs. The value of the function at a certain value of the abscissa is obtained using the given ordered pairs.
f(x) = f(x_0) + (x − x_0) \dfrac{f(x_1) − f(x_0)}{x_1 − x_0} or
y = y_0 + (x - x_0) \dfrac{y_1 - y_0}{x_1 - x_0} 
Lagrange Interpolation Formula
This method is employed where the given data set consists of more than two ordered pairs and can be used to derive a polynomial, which further assumes certain arbitrary values on certain points.
f(x) = \dfrac{(x − x_0)(x-x_2)(x-x_3)(x-x_4)}{(x_1 − x_0)(x_1-x_2)(x_1-x_3)(x_1-x_4)} + \dfrac{(x − x_0)(x − x_1)(x − x_3)(x − x_4)}{(x_2 − x_0)(x_2 − x_1)(x_2 − x_3)(x_2 − x_4)}+\dfrac{(x − x_0)(x − x_1)(x − x_2)(x − x_4)}{(x_3 − x_0)(x_3 − x_1)(x_3 − x_2)(x_3 − x_4)}+.... 
Leading Difference Formula
This method is used when the data set itself is kind of incomplete, i.e., where the frequency of one or more data sets is missing. In this case, the leading difference up to the number of known items is always zero and is given as:
△n0 = (y − 1)n = yn − ayn-1 + byn-2 − cyn-3 +....+ y0 = 0
Quadratic Interpolation Formula
It is a refined form of linear interpolation method and is given as:
f(x_j + θh) ≈ f_j + θΔf_j + \frac{1}{2}θ(θ-1)Δ^2f_j 
Uses of Interpolation
Various uses of Interpolation are given below:
- Creating a Function from Data Points: Interpolation helps convert a set of scattered data points into a mathematical function that passes through the known points, making the data easier to analyze and visualize.
- Estimating Unknown Values: It is used to find values that lie between known data points when direct measurements are unavailable.
- Obtaining Piecewise Polynomials: Interpolation can represent complex functions using simpler polynomial segments, making calculations more manageable.
- Simplifying Integration and Differentiation: By approximating functions with polynomials, interpolation makes it easier to perform calculus operations such as integration and differentiation.
- Solving Complex Numerical Problems: When analytical solutions are difficult or impossible to obtain, interpolation provides approximate solutions that help simplify computations.
- Curve Fitting and Data Analysis: It is widely used in engineering, science, and statistics to model trends and understand relationships within data.
➣Practice: Solved Examples
