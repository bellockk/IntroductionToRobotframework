import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
x, y = np.loadtxt('output.csv', delimiter=',', unpack=True)
plt.plot(x, y, label='Results')
plt.xlabel('x')
plt.ylabel('y')
plt.title('System Output')
plt.legend()
plt.savefig('output.png')
