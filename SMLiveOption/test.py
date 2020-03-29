import numpy as np
import matplotlib.pyplot as plt
from matplotlib import style
import sys
import ast


x=ast.literal_eval(sys.argv[1])
cy=ast.literal_eval(sys.argv[2])
py=ast.literal_eval(sys.argv[3])
expiry=sys.argv[4]


w=0.2
a=np.arange(len(x))
opacity=0.5

style.use('seaborn')
plt.subplots(num=None, figsize=(15, 10))
plt.bar(a, cy, w, color="g", label="Change in OI For Call", alpha=opacity)
plt.bar(a+w, py, w, color="r", label="Change in OI For Put", alpha=opacity)
plt.legend()
plt.xlabel("\nStrike Price")
plt.ylabel("Change in OI")
plt.title("Change in OI on Call and Put "+expiry)
plt.xticks(a+w, x)
plt.tight_layout()
plt.show()


















