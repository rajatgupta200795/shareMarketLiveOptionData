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
        return mul/5

    def draw(self):

        x = self.x
        skip = int(len(x)/25)
        x = x
        print(skip)
        y = self.y
        y = y
        xLabel = self.xLabel
        yLabel = self.yLabel
        detailedLabel = self.detailedLabel
        title = self.title

        ymax = max(y)
        ymin = min(y)
        xmax = max(x)
        xmin = min(x)
        yspace = self.nearest_top(max(abs(ymin), ymax))
        if ymin<0:
            yspacebottom=-yspace
        else:
            yspacebottom=0

        #style.use('seaborn')

        fig, ax = plt.subplots(num=None, figsize=(25, 16), facecolor='w', edgecolor='r')
        plt.title(title)
        plt.xlabel(xLabel)
        plt.ylabel(yLabel)
        ax.set_xlabel(detailedLabel)
        ax.plot(x,y)

        # for tick in ax.get_xticklabels():
        #   tick.set_rotation(0)

        plt.grid(True, color='grey')
        plt.legend()
        #plt.xticks(np.arange(int(xmin.replace(':','')), int(xmax.replace(':','')), 10))
        plt.yticks(np.arange(yspacebottom, yspace, yspace * 0.1))
        #print(int((xmin.replace(':',''))[0:4]))
        #print(int((xmax.replace(':',''))[0:4]))
        plt.show()


x=[]
y=[]

p=DesignBarChart(x, y, "Strike Price", "Change in OI", "\nChange in Open Interest with Strike Price", "Change in Open Interest")
p.draw()