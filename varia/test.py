import numpy as np
from scipy.optimize import curve_fit
import pandas as pd


mq135_under20 = {'x': [-9.244186046511626, -6.918604651162788, -4.59302325581395, -2.2093023255813904, -0.05813953488371837, 2.325581395348838, 4.418604651162791, 6.744186046511629, 9.534883720930232, 12.325581395348834, 15.116279069767444, 18.139534883720927],
                 'y': [1.6783410138248844, 1.6064516129032251, 1.5262672811059899, 1.4460829493087546, 1.3824884792626715, 1.3133640552995376, 1.2608294930875559, 1.2027649769585236, 1.1419354838709657, 1.0838709677419331, 1.0396313364055274, 1.011981566820274]}
MQ135_under20_df = pd.DataFrame(mq135_under20)
mq135_over20 = {'x': [21.918604651162802, 25.17441860465116, 28.139534883720934, 31.51162790697675, 34.418604651162795, 37.674418604651166, 40.465116279069775, 43.48837209302326, 46.27906976744187, 48.837209302325604],
                 'y': [0.9815668202764949, 0.9677419354838681, 0.9594470046082921, 0.9511520737327162, 0.9400921658986148, 0.9373271889400894, 0.934562211981564, 0.9290322580645132, 0.920737327188937, 0.912442396313361]}
MQ135_over20_df = pd.DataFrame(mq135_over20)

# Experimental data (replace with your actual data)
temperature_under_20 = MQ135_under20_df['x']  # Temperature data under 20°C
humidity_under_20 = [33] * len(temperature_under_20)  # Humidity data
sensor_output_under_20 = MQ135_under20_df['y']  # Sensor output corresponding to temperature and humidity

temperature_over_20 = MQ135_over20_df['x']  # Temperature data over 20°C
humidity_over_20 = [33] * len(temperature_over_20)  # Humidity data
sensor_output_over_20 = MQ135_over20_df['y']  # Sensor output corresponding to temperature

# Define quadratic model for temperatures under 20°C
# def quadratic_model(t, a, b, c, d):
def quadratic_model(t, a):
    return 0.00046307428153304244 * t ** 2 - 0.02906738438091286 * t + 1.3784941304658396 + a * (np.array(humidity_under_20) -33)  # Using numpy array for element-wise subtraction

# Define linear model for temperatures over 20°C
# def linear_model(t, a, b, c):
def linear_model(t, a):
    return -0.002329525704310693 * t + 1.026785488456616 + a * np.array(humidity_over_20)  # Using numpy array for element-wise multiplication

# Curve fitting for temperatures under 20°C
coefficients_under_20, _ = curve_fit(quadratic_model, temperature_under_20, sensor_output_under_20)

# Curve fitting for temperatures over 20°C
coefficients_over_20, _ = curve_fit(linear_model, temperature_over_20, sensor_output_over_20)

# # Extract coefficients
# a_under_20, b_under_20, c_under_20, d_under_20 = coefficients_under_20
# a_over_20, b_over_20, c_over_20 = coefficients_over_20

# # Print coefficients
# print("Under 20°C coefficients (a, b, c, d):", a_under_20, b_under_20, c_under_20, d_under_20)
# print("Over 20°C coefficients (a, b, c):", a_over_20, b_over_20, c_over_20)

print("Under 20°C coefficients (a):", coefficients_under_20)
print("Over 20°C coefficients (a):", coefficients_over_20)