import numpy as np
import matplotlib.pyplot as plt
from matplotlib import style


py=[
  93375,
  -21225,
  -192150,
  -13500,
  -12000,
  -62100,
  -206775,
  37275,
  6825,
  -77850,
  -47850,
  329175,
  61200,
  38175,
  98100,
  9675,
  -55200,
  -525,
  975,
  300,
  2775
]

cy=[
  0,
  0,
  -75,
  -75,
  -4200,
  -150,
  -23850,
  -1575,
  -42375,
  -312375,
  -154350,
  6525,
  581775,
  530700,
  1101825,
  428175,
  763650,
  497625,
  543525,
  150750,
  477075
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

w=0.2
a=np.arange(len(x))
opacity=0.5

style.use('seaborn')
plt.bar(a, cy, w, color="g", label="Change in OI For Call", alpha=opacity)
plt.bar(a+w, py, w, color="r", label="Change in OI For Put", alpha=opacity)
plt.legend()
plt.xlabel("\nStrike Price")
plt.ylabel("Change in OI")
plt.title("Change in OI For Call and Put")
plt.xticks(a+w, x)
plt.tight_layout()
plt.show()















