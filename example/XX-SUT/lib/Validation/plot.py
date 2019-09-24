import os
from robot.api.deco import keyword
from robot.api import logger
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
__all__ = ['plot']

@keyword('Plot CSV file "${filename}" to "${output}"')
def plot(filename, output):
    """
    Some intro to the keyword

    Tags: plot, example
    """
    x, y = np.loadtxt(filename, delimiter=',', unpack=True)
    plt.plot(x, y, label='Results')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title('System Output')
    plt.legend()
    dirname = os.path.dirname(output)
    if not os.path.exists(dirname):
        os.makedirs(dirname)
    plt.savefig(output)
    logger.info('<img src="{0}" alt="Example plot">'.format(output), html=True)
