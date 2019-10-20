# importing matplotlib module
from matplotlib import pyplot as plt
from matplotlib import style
import numpy as np


class DesignBarChart:

    def __init__(self, x, y, xLabel, yLabel, detailedLabel, title):
        self.x=x
        self.y=y
        self.xLabel=xLabel
        self.yLabel=yLabel
        self.detailedLabel=detailedLabel
        self.title = title


    def nearest_top(self, ymax):
        mul = 1
        y = ymax
        while y != 0:
            y = int(y / 10)
            mul = mul * 10
        return mul

    def draw(self):

        x = self.x
        y = self.y
        xLabel = self.xLabel
        yLabel = self.yLabel
        detailedLabel = self.detailedLabel
        title = self.title

        ymax = max(y)
        ymin = min(y)
        xmax = max(x)
        xmin = min(x)
        yspace = self.nearest_top(ymax)

        style.use('seaborn')

        fig, ax = plt.subplots(num=None, figsize=(25, 16), facecolor='w', edgecolor='r')
        plt.title(title)
        plt.xlabel(xLabel)
        plt.ylabel(yLabel)
        ax.set_xlabel(detailedLabel)
        barplot = ax.bar(x, y, color='blue', label=yLabel, width=20)

        # for tick in ax.get_xticklabels():
        #   tick.set_rotation(0)

        plt.grid(True, color='grey')
        plt.legend()
        plt.xticks(np.arange(xmin, xmax + 1, 50))
        plt.yticks(np.arange(-yspace, yspace, yspace * 0.1))

        for bar in barplot:
            yval = bar.get_height()
            plt.text(bar.get_x(), yval + yspace * 0.05 * (yval / abs(yval)), int(yval), va='bottom')


        plt.show()


y=[
  -450,
  -300,
  -225,
  75,
  -4575,
  -675,
  -27300,
  -2475,
  -72675,
  -1575,
  -165750,
  -135750,
  -36000,
  278100,
  275025,
  103275,
  631275,
  126675,
  278925,
  155850,
  652650
]

x=[
  11000,
  11050,
  11100,
  11150,
  11200,
  11250,
  11300,
  11350,
  11400,
  11450,
  11500,
  11550,
  11600,
  11650,
  11700,
  11750,
  11800,
  11850,
  11900,
  11950,
  12000
]

p=DesignBarChart(x, y, "Strike Price", "Change in OI", "\nChange in Open Interest with Strike Price", "Change in Open Interest")
p.draw()