# Objective

The objective of this assignment is to explore the numerical solution of ordinary differential equations (ODEs) using a modified Four-Stage Runge-Kutta (RK) method. The assignment focuses on implementing novel weighting coefficients and slope computation parameters to enhance accuracy and stability. Additionally, scalability and error analysis were performed by comparing numerical and exact solutions.

# Problem Statement

We are tasked to solve the following ODE using a modified RK4 method:

## Parameters:

a = 3 (last two digits of roll number)

b = 1.33 (based on roll number)

Domain: 

Initial Condition: 

# Modified Four-Stage Runge-Kutta Method

The Four-Stage RK method is given by:

where:

## Coefficients:

The chosen coefficients for the modified RK4 method are:

Weights (): 

Slope Computation Locations (): 

Slope Weights (): 

## Rationale for Coefficients:

Weights ():

The weights sum to 1, ensuring a proper approximation.

Emphasis is placed on intermediate stages for improved accuracy.

Locations ():

Evenly spaced values in  ensure balanced slope computation.

Slope Weights ():

Dependence on previous slopes is gradually increased for better stability.

# Numerical Implementation

## Parameters:

a = 3, b = 1.33

 Domain: 

Initial Condition: 

Number of Intervals (N): 20

Step Size (h):

# Scalability Analysis

The RMSE decreases consistently as the step size is reduced, demonstrating:

Stability: The method remains well-behaved for smaller step sizes.

Convergence: Numerical solutions approach the exact solution as .

## Graphs:

Numerical vs. Exact Solution:

A plot showing the close match between the two solutions.

RMSE vs. Step Size:

A log-log plot highlighting the error reduction trend.

# Conclusion

1.  The modified RK4 method with chosen coefficients provides a stable and accurate solution for the given ODE.
2.  The RMSE analysis validates the effectiveness of the coefficients, showing significant error reduction with decreasing step size.
3.  The implementation demonstrates the scalability of the method and the suitability of the novel coefficients for enhancing numerical accuracy.
